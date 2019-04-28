Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A08DA4A
	for <lists+amd-gfx@lfdr.de>; Mon, 29 Apr 2019 03:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BA7F89101;
	Mon, 29 Apr 2019 01:04:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Sun, 28 Apr 2019 23:49:49 UTC
Received: from mo6-p00-ob.smtp.rzone.de (mo6-p00-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5300::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EABC8910C
 for <amd-gfx@lists.freedesktop.org>; Sun, 28 Apr 2019 23:49:48 +0000 (UTC)
X-RZG-AUTH: ":NW0KfEuIYvY/xzctq0OeiE2W912UUs5cb1akLvZ1gZCDX/4R8MPEuGWDreWybbA2vpHTGLEw"
X-RZG-CLASS-ID: mo01
Received: from [192.168.178.49] by smtp.strato.de (RZmta 44.18 DYNA|AUTH)
 with ESMTPSA id U0a003v3SNhaaZU
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 29 Apr 2019 01:43:36 +0200 (CEST)
From: Yanik Yiannakis <yanik@yiannakis.de>
To: rex.zhu@amd.com, evan.quan@amd.com, amd-gfx@lists.freedesktop.org
Subject: Bug Report: [PowerPlay] MCLK can't be set above 1107MHz on Vega 64
Message-ID: <f0312882-75cf-f79e-9fe8-fd95adf739b9@yiannakis.de>
Date: Mon, 29 Apr 2019 01:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Mon, 29 Apr 2019 01:04:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 t=1556495387; 
 s=strato-dkim-0002; d=yiannakis.de;
 h=Date:Message-ID:Subject:To:From:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=JvE4OVC+AerUOHcuz13yc41A13yJLqIWLX9/xcj9doI=;
 b=cgXR3cT5P6YrNrJupSIB+gDyS4lVw2cUdGePC7SsSAN5Eqjt70Q80Hi2ZGnkdQrWnu
 URQUECBR2wMQCbcAKY8RMSVb8SHI2RnuGX+jJANV5vL2+aDrDatAJFidXVl53BWLorZU
 6vUEQO5z1SP6184NXaH4heXuz6pmeuXB5OpTJlETczKVsMga9+zKQxQz+qaOLv9X6yjU
 wPOqMUmR5Hm/kxMMl8uZWzf/w5VON55DEg485uFASvQ28sSbfHg8mhwffbWrFMTLYZgi
 MFvhS+lzN9M5VcMtrBEYRks1IRkBrKEO3mPzvbCV+5C6qfZuChjdG2Y+K8rX2Naad59f
 BA9Q==
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1747236445=="
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1747236445==
Content-Type: multipart/alternative;
 boundary="------------0FB2303EDAFD7566FB4DA1EA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0FB2303EDAFD7566FB4DA1EA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

I experience a bug that prevents me from setting the MCLK of my Vega 64 
LC above 1107MHz.

I am using Unigine Superposition 1.1 in "Game"-mode to check the 
performance by watching the FPS.


*Behaviour with a single monitor:*

First I set the MCLK to a known stable value below 1108MHz:

/$ echo "m 3 1100 950" > 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage 
/

In Unigine Superposition the FPS increase as expected.

pp_dpm_mclk also confirms the change.

/$ watch cat 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_dpm_mclk/

    0: 167Mhz
    1: 500Mhz
    2: 800Mhz
    3: 1100Mhz *


After that I set the MCLK to a stable value above 1107MHz:

/$ echo "m 3 1200 950" > 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage 
/

In Unigine Superposition the FPS drop drastically.

pp_dpm_mclk indicates that the MCLK is stuck in state 0 (167MHz):

    0: 167Mhz *
    1: 500Mhz
    2: 800Mhz
    3: 1200Mhz


*Behaviour with multiple monitors that have different refresh rates:*

My monitors have different refresh rates. This causes the MCLK to stay 
in state 3 (945MHz stock) which is the expected behaviour as I 
understand it.


Now I try to set the MCLK to a value above 1107MHz:

/$ echo "m 3 1200 950" > 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage 
/

The FPS in Unigine Superposition remain the same as they were with 945MHz.

pp_dpm_mclk shows however that the value was set:

    0: 167Mhz
    1: 500Mhz
    2: 800Mhz
    3: 1200Mhz *


Then I set the MCLK to a value of 1107MHz or lower:

/$ echo "m 3 1100 950" > 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage 
/

The FPS in Unigine Superposition *increase*.

pp_dpm_mclk again confirms the set value:

    0: 167Mhz
    1: 500Mhz
    2: 800Mhz
    3: 1100Mhz *


Finally I increase MCLK to a known unstable value:

/$ echo "m 3 1300 950" > 
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage 
/

The FPS in Unigine Superposition remain the same. I therefore believe 
the value was not actually applied.

However pp_dpm_mclk shows that it was:

    0: 167Mhz
    1: 500Mhz
    2: 800Mhz
    3: 1300Mhz *


amdgpu_pm_info also claims that the value was set:

/$ sudo watch cat /sys/kernel/debug/dri/1/amdgpu_pm_info/

    GFX Clocks and Power:
             1300 MHz (MCLK)
             27 MHz (SCLK)
             1348 MHz (PSTATE_SCLK)
             800 MHz (PSTATE_MCLK)
             825 mV (VDDGFX)
             4.0 W (average GPU)

Again, I think the displayed MCLK is false and the memory still runs at 
1100MHz because the performance in Unigine Superposition indicates this 
and 1300MHz would cause a crash immediately.

A stable value (e.g. 1200MHz) causes the same behaviour. I just chose 
1300MHz to be sure.



Tested on these Kernels:

    Arch-Linux 5.0.9 (Arch)

    Linux 5.1-rc6 (Ubuntu)

    Linux 5.0 with amd-staging-drm-next (Ubuntu)
    (https://github.com/M-Bab/linux-kernel-amdgpu-binaries)

(Same behaviour on every kernel.)


Tested on this hardware:

    CPU: Intel i7-8700k

    Motherboard: MSI Z370 Gaming Pro Carbon

    GPU: Powercolor Vega 64 Liquid Cooled (Memory stable below 1220MHz,
    tested on Windows 10 with Wattman and Unigine Superposition)


Unigine Superposition "Game"-Mode settings:

    Preset: Custom

    Fullscreen: Disabled

    Resolution: 3840x2160 (4K UHD)

    Shaders Quality: Extreme

    Textures Quality: High

    Vsync: Off

    Depth of Field: On

    Motion Blur: On


I hope this helps.

Yanik Yiannakis


--------------0FB2303EDAFD7566FB4DA1EA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hello,<br>
    </p>
    <p>I experience a bug that prevents me from setting the MCLK of my
      Vega 64 LC above 1107MHz. <br>
    </p>
    <p>I am using Unigine Superposition 1.1 in "Game"-mode to check the
      performance by watching the FPS.</p>
    <br>
    <p><b>Behaviour with a single monitor:</b></p>
    <p>First I set the MCLK to a known stable value below 1108MHz:</p>
    <p><i>$ echo "m 3 1100 950" &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage
      </i><br>
    </p>
    <p>In Unigine Superposition the FPS increase as expected. <br>
    </p>
    <p>pp_dpm_mclk also confirms the change.
    </p>
    <p><i>$ watch cat
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_dpm_mclk</i><br>
    </p>
    <blockquote>
      <p>0: 167Mhz<br>
        1: 500Mhz<br>
        2: 800Mhz<br>
        3: 1100Mhz *</p>
    </blockquote>
    <p><br>
    </p>
    <p>After that I set the MCLK to a stable value above 1107MHz:<br>
    </p>
    <p><i>$ echo "m 3 1200 950" &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage
      </i><br>
    </p>
    <p>In Unigine Superposition the FPS drop drastically.<br>
    </p>
    <p>pp_dpm_mclk indicates that the MCLK is stuck in state 0 (167MHz):<br>
    </p>
    <blockquote>
      <p>0: 167Mhz *<br>
        1: 500Mhz<br>
        2: 800Mhz<br>
        3: 1200Mhz</p>
    </blockquote>
    <p><br>
    </p>
    <p><b>Behaviour with multiple monitors that have different refresh
        rates:</b><br>
    </p>
    <p>My monitors have different refresh rates. This causes the MCLK to
      stay in state 3 (945MHz stock) which is the expected behaviour as
      I understand it.</p>
    <p><br>
    </p>
    <p>Now I try to set the MCLK to a value above 1107MHz:<br>
    </p>
    <p><i>$ echo "m 3 1200 950" &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage
      </i></p>
    <p>The FPS in Unigine Superposition remain the same as they were
      with 945MHz.<br>
    </p>
    <p>pp_dpm_mclk shows however that the value was set:<br>
    </p>
    <blockquote>
      <p>0: 167Mhz<br>
        1: 500Mhz<br>
        2: 800Mhz<br>
        3: 1200Mhz *<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Then I set the MCLK to a value of 1107MHz or lower:<br>
    </p>
    <p><i>$ echo "m 3 1100 950" &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage
      </i></p>
    <p>The FPS in Unigine Superposition <b>increase</b>.<br>
    </p>
    <p>pp_dpm_mclk again confirms the set value:<br>
    </p>
    <blockquote>
      <p>0: 167Mhz<br>
        1: 500Mhz<br>
        2: 800Mhz<br>
        3: 1100Mhz *</p>
    </blockquote>
    <p><br>
    </p>
    Finally I increase MCLK to a known unstable value:<br>
    <p><i>$ echo "m 3 1300 950" &gt;
/sys/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:00.0/0000:03:00.0/pp_od_clk_voltage
      </i></p>
    <p>The FPS in Unigine Superposition remain the same. I therefore
      believe the value was not actually applied.<br>
    </p>
    <p>However pp_dpm_mclk shows that it was:<br>
    </p>
    <blockquote>
      <p>0: 167Mhz<br>
        1: 500Mhz<br>
        2: 800Mhz<br>
        3: 1300Mhz *</p>
    </blockquote>
    <p><br>
    </p>
    <p>amdgpu_pm_info also claims that the value was set:<br>
    </p>
    <p><i>$ sudo watch cat /sys/kernel/debug/dri/1/amdgpu_pm_info</i><br>
    </p>
    <blockquote>
      <p>GFX Clocks and Power:<br>
                1300 MHz (MCLK)<br>
                27 MHz (SCLK)<br>
                1348 MHz (PSTATE_SCLK)<br>
                800 MHz (PSTATE_MCLK)<br>
                825 mV (VDDGFX)<br>
                4.0 W (average GPU)<br>
      </p>
    </blockquote>
    <p>Again, I think the displayed MCLK is false and the memory still
      runs at 1100MHz because the performance in Unigine Superposition
      indicates this and 1300MHz would cause a crash immediately.</p>
    <p>A stable value (e.g. 1200MHz) causes the same behaviour. I just
      chose 1300MHz to be sure.<br>
    </p>
    <p><br>
    </p>
    <p><br>
    </p>
    <p>Tested on these Kernels:</p>
    <blockquote>
      <p>Arch-Linux 5.0.9 (Arch)<br>
      </p>
      <p>Linux 5.1-rc6 (Ubuntu)<br>
      </p>
      <p>Linux 5.0 with amd-staging-drm-next (Ubuntu)
        (<a class="moz-txt-link-freetext" href="https://github.com/M-Bab/linux-kernel-amdgpu-binaries">https://github.com/M-Bab/linux-kernel-amdgpu-binaries</a>)<br>
      </p>
    </blockquote>
    <p>(Same behaviour on every kernel.)<br>
    </p>
    <p><br>
    </p>
    <p>Tested on this hardware:</p>
    <blockquote>
      <p>CPU: Intel i7-8700k</p>
      <p>Motherboard: MSI Z370 Gaming Pro Carbon<br>
      </p>
      <p>GPU: Powercolor Vega 64 Liquid Cooled (Memory stable below
        1220MHz, tested on Windows 10 with Wattman and Unigine
        Superposition)<br>
      </p>
    </blockquote>
    <p><br>
    </p>
    <p>Unigine Superposition "Game"-Mode settings: <br>
    </p>
    <blockquote>
      <p>Preset: Custom<br>
      </p>
      <p>Fullscreen: Disabled</p>
      <p>Resolution: 3840x2160 (4K UHD)</p>
      <p>Shaders Quality: Extreme</p>
      <p>Textures Quality: High</p>
      <p>Vsync: Off</p>
      <p>Depth of Field: On</p>
      <p>Motion Blur: On</p>
    </blockquote>
    <p><br>
    </p>
    <p>I hope this helps.</p>
    <p>Yanik Yiannakis<br>
    </p>
  </body>
</html>

--------------0FB2303EDAFD7566FB4DA1EA--

--===============1747236445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4

--===============1747236445==--
