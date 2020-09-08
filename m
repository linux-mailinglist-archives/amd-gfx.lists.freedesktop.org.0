Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3622627F3
	for <lists+amd-gfx@lfdr.de>; Wed,  9 Sep 2020 09:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFC76E9F6;
	Wed,  9 Sep 2020 07:05:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EDC6E859
 for <amd-gfx@lists.freedesktop.org>; Tue,  8 Sep 2020 16:27:17 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id g96so15326382otb.12
 for <amd-gfx@lists.freedesktop.org>; Tue, 08 Sep 2020 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=qe8786Kv2/Cdda8ENAC5J9OvVx6/GLW0ZvDTGCUEWHI=;
 b=pEBwEHKEb1Dk4iDE+bs0N/QmZmfmRHAdNjZfAPX4VRrtoLeqOs0RvZiP3PyjyhGTyR
 7314mZnv/TVtui8z8++jmRdhor2lXGLxeiyDlFvN52zTnMO4zevmY2agOGtGDjhJRe9n
 2GVBGNe42bsAb3MLIRBr1nS7CgafY02zu/kzxWNZFIGhyzvePv5Lh1hkSSz6pkuNALvK
 nmDT5DrQ+MFgy0hqKBAdlvg5eChxI61+3JKMJvrEHHRPAQus7XNObK8IsKB+rhuGI49C
 rmXQSScHmMbvAQuES7ldtKynOvtJzb/pf2YPUWMIDgdE6eg9xRq5jSsrbraprvmo+4rl
 QlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qe8786Kv2/Cdda8ENAC5J9OvVx6/GLW0ZvDTGCUEWHI=;
 b=l4BZDb3UhfylsYmtKk+s36cf5B94oVdmKOBwrFkXTpOnN8BHe8mauiGsHTBiyI2XEG
 k+xOtfFO7iqT25vo7Mrs5GgVLZo70CSx8x5AQvKyyj83kXGYPYAA42VY4gUQjWMjlFue
 Wil82OuT0ENFK4j57fufWmOzJHvBixdwAzGaMmIiN/VLi04bmQ2xVZW7xzl5mkB9QJp6
 KgF37QMTVYtCWyXoss1OBjLeI2dj2D7f5VEY4PuCT4PIsKX05+Gds8y5Zj6gnDkazmmb
 l1K/yRKGDTSj8MUifdBTbZaZeM0noRo1dVh+9FeXYTm94RipLdChdhwBYfr8Sj74uRoo
 /psw==
X-Gm-Message-State: AOAM532bsCvNIULTvU9uZ/qJmCtb/3EdoVxMRhCVi+NOpzfMH44ksRj6
 ba9qi/ptcko4JsgLvV841NepZ/7bpoo7N8S5dLQ=
X-Google-Smtp-Source: ABdhPJwF/dno6+Gp7uQwcYtb25LqX/clnTegre5FuzZSMtCcMNYZYLn4O1EQY/jnjgJOWLOT5h/Ux9vDuj/4wGpzMl4=
X-Received: by 2002:a9d:345:: with SMTP id 63mr18625809otv.370.1599582436249; 
 Tue, 08 Sep 2020 09:27:16 -0700 (PDT)
MIME-Version: 1.0
From: Mikael Pettersson <mikpelinux@gmail.com>
Date: Tue, 8 Sep 2020 18:27:05 +0200
Message-ID: <CAM43=SOCs699z9E1EK3EG8BCJFw_9veWa7xWOEokvwj01NVS6Q@mail.gmail.com>
Subject: [REGRESSION][BISECTED] 5.9-rc4 disables console on radeon
To: Linux Kernel list <linux-kernel@vger.kernel.org>,
 amd-gfx@lists.freedesktop.org, Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:05:18 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Starting with linux-5.9-rc4, the Dell monitor on my desktop PC goes
black during boot
when the kernel activates the framebuffer console, except for this
error message shown
in the center of the screen:

"Dell U2412M
 The current input timing is not supported by the monitor display. Please
 change your input timing to 1920x1200@60Hz or any other monitor
 listed timing as per the monitor specifications.
 <DVI symbol>"

The monitor remains black until I reboot.

All kernels up to and including 5.9-rc3 were Ok.  A git bisect identified

# first bad commit: [fc8c70526bd30733ea8667adb8b8ffebea30a8ed]
drm/radeon: Prefer lower feedback dividers

as the culprit, and reverting that from -rc4 makes the console work again.

Adding a bit of debugging code to that function shows:

avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137
avivo_get_fb_ref_div: fb_div_new 142 fb_div_old 143
avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137
avivo_get_fb_ref_div: fb_div_new 119 fb_div_old 120
avivo_get_fb_ref_div: fb_div_new 136 fb_div_old 137

during boot, where "new" is what the commit above changed the code to compute,
and "old" is the value computed by the working code from rc3.

The graphics card is a Radeon HD6450 silent model:
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc.
[AMD/ATI] Caicos [Radeon HD 6450/7450/8450 / R5 230 OEM] (prog-if 00
[VGA controller])
_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx
