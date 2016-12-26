/* -*- mode: java; c-basic-offset: 2; indent-tabs-mode: nil -*- */

/*
  Copyright (c) The Processing Foundation 2016
  Developed by Gottfried Haider

  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 2.1 of the License, or (at your option) any later version.

  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General
  Public License along with this library; if not, write to the
  Free Software Foundation, Inc., 59 Temple Place, Suite 330,
  Boston, MA  02111-1307  USA
*/

package gohai.glvideo;

import processing.core.*;
import java.util.ArrayList;
import java.util.Collections;

/**
 *  @webref
 */
public class GLCapture extends GLVideo {

  protected static String[][] devices;

  public GLCapture(PApplet parent) {
    super(parent, 0);

    if (devices == null) {
      devices = gstreamer_getDevices();
    }

    if (devices.length == 0) {
      throw new RuntimeException("No capture devices found");
    }

    // get optimal config for first device
    ArrayList<Caps> caps = Caps.getAllCapsFiltered(devices[0][2], false);
    String[] configs = Caps.getConfigArraySorted(caps);
    String chosen = Caps.getFirstConfig(configs);

    handle = gstreamer_openDevice(devices[0][0], chosen, 0);
    if (handle == 0) {
      throw new RuntimeException("Could not open capture device " + devices[0][0]);
    }
  }

  public GLCapture(PApplet parent, String deviceName) {
    super(parent, 0);

    if (devices == null) {
      devices = gstreamer_getDevices();
    }

    for (int i=0; i < devices.length; i++) {
      if (devices[i][0].equals(deviceName)) {
        // get optimal config for this device
        ArrayList<Caps> caps = Caps.getAllCapsFiltered(devices[i][2], false);
        String[] configs = Caps.getConfigArraySorted(caps);
        String chosen = Caps.getFirstConfig(configs);

        handle = gstreamer_openDevice(devices[i][0], chosen, 0);
        if (handle == 0) {
          throw new RuntimeException("Could not open capture device " + devices[i][0]);
        }

        return;
      }
    }

    throw new RuntimeException("Cannot find capture device " + deviceName);
  }

  public GLCapture(PApplet parent, String deviceName, float fps) {
    // XXX: this picks e.g. 640x480 for 25 fps
    this(parent, deviceName, "video/x-raw, framerate=" + fpsToFramerate(fps));
  }

  public GLCapture(PApplet parent, String deviceName, int width, int height) {
    // XXX: this picks e.g. 10 fps for 1280x720
    this(parent, deviceName, "video/x-raw, width=" + width + ", height=" + height);
  }

  public GLCapture(PApplet parent, String deviceName, int width, int height, float fps) {
    this(parent, deviceName, "video/x-raw, width=" + width + ", height=" + height + ", framerate=" + fpsToFramerate(fps));
  }

  public GLCapture(PApplet parent, String deviceName, String config) {
    super(parent, 0);

    handle = gstreamer_openDevice(deviceName, config, 0);
    if (handle == 0) {
      throw new RuntimeException("Could not open capture device " + deviceName);
    }
  }

  public static String[] list() {
    // make sure the library is loaded
    loadGStreamer();
    // re-fetch the devices list, even if we have it already
    devices = gstreamer_getDevices();

    // XXX: is the device name guaranteed to be unique?
    String[] device_names = new String[devices.length];
    for (int i=0; i < devices.length; i++) {
      device_names[i] = devices[i][0];
    }
    return device_names;
  }

  public static String[] configs(String deviceName) {
    if (devices == null) {
      loadGStreamer();
      devices = gstreamer_getDevices();
    }

    for (int i=0; i < devices.length; i++) {
      if (deviceName.equals(devices[i][0])) {
        if (devices[i][2] == null || devices[i][2].length() == 0) {
          return new String[0];
        } else {
          ArrayList<Caps> caps = Caps.getAllCapsFiltered(devices[i][2], true);
          return Caps.getConfigArraySorted(caps);
        }
      }
    }

    throw new RuntimeException("Cannot find capture device " + deviceName);
  }

  public static float framerateToFps(String fraction) {
    int i = fraction.indexOf('/');
    if (i != -1) {
      float num = Float.parseFloat(fraction.substring(0, i));
      float denom = Float.parseFloat(fraction.substring(i+1));
      return num / denom;
    } else {
      throw new RuntimeException("Unexpected argument " + fraction);
    }
  }

  public static String fpsToFramerate(float fps) {
    String formatted = Float.toString(fps);
    // this presumes the delimitter is always a dot
    int i = formatted.indexOf('.');
    if (Math.floor(fps) != fps) {
      int denom = (int)Math.pow(10, formatted.length()-i-1);
      int num = (int)(fps * denom);
      return num + "/" + denom;
    } else {
      return (int)fps + "/1";
    }
  }


  static class Caps implements Cloneable, Comparable {

    String full_caps;
    String mime;
    String format;
    int width;
    int height;
    String interlace_mode;
    String framerate;        // fraction
    float fps;

    public Object clone() throws CloneNotSupportedException {
      return super.clone();
    }

    public int compareTo(Object obj) {
      Caps otherCap = (Caps)obj;

      if ("video/x-raw".equals(mime) && !"video/x-raw".equals(otherCap.mime)) {
        return -1;
      }
      if ("progressive".equals(interlace_mode) && !"progressive".equals(otherCap.interlace_mode)) {
        return -1;
      }
      if (otherCap.height < height) {
        return -1;
      } else if (height < otherCap.height) {
        return 1;
      }
      if (otherCap.width < width) {
        return -1;
      } else if (width < otherCap.width) {
        return 1;
      }
      if (otherCap.fps < fps) {
        return -1;
      } else if (fps < otherCap.fps) {
        return 1;
      }
      if ("RGBA".equals(format) && !"RGBA".equals(otherCap.format)) {
        return -1;
      }
      if ("RGB".equals(format) && !"RGB".equals(otherCap.format)) {
        return -1;
      }
      return 0;
    }

    public String toString() {
      return mime + ", width=" + width + ", height=" + height + ", framerate=" + framerate;
    }


    public static ArrayList<Caps> getAllCaps(String full) {
      ArrayList<Caps> caps = new ArrayList<Caps>();
      if (full != null && 0 < full.length()) {
        String[] lines = full.split("; ");
        for (int i=0; i < lines.length; i++) {
          caps.addAll(getCaps(lines[i]));
        }
      }
      return caps;
    }

    public static ArrayList<Caps> getAllCapsFiltered(String full, boolean verbose) {
      ArrayList<Caps> caps = new ArrayList<Caps>();
      if (full != null && 0 < full.length()) {
        String[] lines = full.split("; ");
        for (int i=0; i < lines.length; i++) {
          try {
            caps.addAll(getCapsFiltered(lines[i]));
          } catch (Exception e) {
            if (verbose) {
              System.err.println("Cannot parse capability: " + lines[i]);
            }
          }
        }
      }
      return caps;
    }

    public static ArrayList<Caps> getCaps(String single) {
      ArrayList<Caps> caps = new ArrayList<Caps>();
      Caps cap = new Caps();
      caps.add(cap);

      cap.full_caps = single;

      // mime type
      cap.mime = single.substring(0, single.indexOf(", "));

      int i = single.indexOf("format=(string)");
      if (i != -1) {
        int j = single.indexOf(", ", i);
        if (j != -1) {
          cap.format = single.substring(i+15, j);
        } else {
          cap.format = single.substring(i+15);
        }
      }

      i = single.indexOf("width=(int)");
      if (i != -1) {
        int j = single.indexOf(", ", i);
        if (j != -1) {
          cap.width = Integer.parseInt(single.substring(i+11, j));
        } else {
          cap.width = Integer.parseInt(single.substring(i+11));
        }
      }

      i = single.indexOf("height=(int)");
      if (i != -1) {
        int j = single.indexOf(", ", i);
        if (j != -1) {
          cap.height = Integer.parseInt(single.substring(i+12, j));
        } else {
          cap.height = Integer.parseInt(single.substring(i+12));
        }
      }

      i = single.indexOf("interlace-mode=(string)");
      if (i != -1) {
        int j = single.indexOf(", ", i);
        if (j != -1) {
          cap.interlace_mode = single.substring(i+23, j);
        } else {
          cap.interlace_mode = single.substring(i+23);
        }
      }

      i = single.indexOf("framerate=(fraction)");
      if (i != -1) {
        String[] temp = null;
        if (single.charAt(i+20) == '{') {
          // handle array of values
          int j = single.indexOf("}, ", i);
          if (j != -1) {
            temp = single.substring(i+22, j-1).split(", ");
          } else {
            temp = single.substring(i+22, single.length()-2).split(", ");
          }
        } else {
          int j = single.indexOf(", ", i);
          temp = new String[1];
          if (j != -1) {
            temp[0] = single.substring(i+20, j);
          } else {
            temp[0] = single.substring(i+20);
          }
        }

        for (i=0; i < temp.length; i++) {
          // create a new Caps instance for each framerate
          if (0 < i) {
            try {
              cap = (Caps)cap.clone();
            } catch (CloneNotSupportedException e) {
            }
            caps.add(cap);
          }

          cap.framerate = temp[i];
          // also convert fraction to float
          cap.fps = GLCapture.framerateToFps(temp[i]);
        }
      }

      return caps;
    }

    public static ArrayList<Caps> getCapsFiltered(String single) {
      ArrayList<Caps> caps = getCaps(single);

      for (int i=0; i < caps.size(); i++) {
        // remove motion JPEG configs and the like
        if (!"video/x-raw".equals(caps.get(i).mime)) {
          caps.remove(i);
          i--;
        }
        // XXX: more?
      }

      return caps;
    }

    public static String[] getConfigArraySorted(ArrayList<Caps> caps) {
      Collections.sort(caps);

      // make sure the top choice has a usable framerate
      if (0 < caps.size() && caps.get(0).fps < 29.96) {
        // look for the highest framerate
        float best_fps = caps.get(0).fps;
        int best_idx = 0;
        for (int i=0; i < caps.size(); i++) {
          if (best_fps < caps.get(i).fps) {
            best_fps = caps.get(i).fps;
            best_idx = i;
          }
          if (29.96 < best_fps) {
            // good enough, no need to go for a lower resolution
            break;
          }
        }
        if (best_idx != 0) {
          // DEBUG
          System.out.println("Promoting " + caps.get(best_idx) + " over " + caps.get(0));
          Caps best = caps.remove(best_idx);
          caps.add(0, best);
        }
      }

      // make stringified output unique
      for (int i=1; i < caps.size(); i++) {
        String needle = caps.get(i).toString();
        boolean found = false;
        for (int j=0; j < i; j++) {
          if (needle.equals(caps.get(j).toString())) {
            found = true;
            break;
          }
        }
        if (found) {
          caps.remove(i);
          i--;
        }
      }

      // convert to string array
      String[] ret = new String[caps.size()];
      for (int i=0; i < caps.size(); i++) {
        ret[i] = caps.get(i).toString();
      }
      return ret;
    }

    public static String getFirstConfig(String[] configs) {
      if (0 < configs.length) {
        return configs[0];
      } else {
        // when we have no suitable configs it might still be better to pass an
        // empty capsfilter string to GStreamer and hope it will figure things out
        return "video/x-raw";
      }
    }
  }
}
