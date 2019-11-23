Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA39107FE8
	for <lists+amd-gfx@lfdr.de>; Sat, 23 Nov 2019 19:23:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE1A6E0DF;
	Sat, 23 Nov 2019 18:23:26 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com
 [IPv6:2607:f8b0:4864:20::44a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5066EE69
 for <amd-gfx@lists.freedesktop.org>; Sat, 23 Nov 2019 05:29:04 +0000 (UTC)
Received: by mail-pf1-x44a.google.com with SMTP id z21so5726541pfr.4
 for <amd-gfx@lists.freedesktop.org>; Fri, 22 Nov 2019 21:29:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=bVyv4YX7sBcmbg/cjO2xV4ng37xlI4Fx14aOVCg/YPk=;
 b=A3a1RvDdP40sD2IBf4wg5hd6uh3FFfAEhcDA6F1cPuQ+nkfAJCJnW4/nVdgKJuq776
 Bv9lP4jguwyQPowI09xWhJpX6w6nnfam9uBbtuUpFk1ZT3VlFqEDBhCKUrcexdA7wEUy
 3KRH8YrrInWw+/1I1Rtdc9OjwF/DJM9+PLe2dF+VbQZ6yjP8V+XC6p5yzBtg51tfgL4C
 fJ3IAhgsPOPhmZPMaUMN/wGlIKYvFFZh9K/CfLcMpaiSzXTHO9+/KyjgbQHWP/cdDBo9
 rqVlWqVbEmJkcvXVRTSpng0i1zkz3//3ljhaRxKpUVK1B0ZYG3+FNGRmg13MGU5gIdGR
 6tUw==
X-Gm-Message-State: APjAAAU0yET8L8xV6+kFLadu4lHDCfMhdyHBEkgfUE7LSETmyR/9XZ/A
 76ch2G3EGFXTz7gPmM8pfT7rEK1c/VG5+4Ecyj0YCA==
X-Google-Smtp-Source: APXvYqxjRM9ai1CA9dNK82G+vFlip7YVCLCIXbLIH1Csg4LCLSDnDb0tkEU778iwITRS6ZGh5nPtALd01sCBSgOx+P7pbA==
X-Received: by 2002:a63:368c:: with SMTP id
 d134mr19610973pga.321.1574486944440; 
 Fri, 22 Nov 2019 21:29:04 -0800 (PST)
Date: Fri, 22 Nov 2019 21:29:00 -0800
Message-Id: <20191123052900.77205-1-thomasanderson@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
Subject: [PATCH] drm/amd/display: Reduce HDMI pixel encoding if max clock is
 exceeded
From: Thomas Anderson <thomasanderson@google.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Sat, 23 Nov 2019 18:23:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=bVyv4YX7sBcmbg/cjO2xV4ng37xlI4Fx14aOVCg/YPk=;
 b=IPue6pH+iGFcyTATyXECvU11P2erhBngc5DZDw11DE48T3vmrNrq3F/wuawLSgPQS8
 uAeMHCTJgtnFhivGAdK4UJdOvjZSSSqf8AUr5PEJVudhYEHTdTOtwzFL20vc96kkNn+X
 3DUz6HFHP+idBPxiFTl9yALA7j71nWC8lCZJPo65yjXErrbFZjlZA+30+pimC9oFmjRR
 IG2ISB2Ah3gctyeBATexyLgYHYVnYW1euFzZLOT10vAogI0L8dTou99IJtiIpQmalROi
 kuVR4o/5csF44JRTjcb+pBKbrh96WXRg04ta3T99TBtzrOfzhV1rnLnbKIR8FIeoTHBB
 BozA==
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
Cc: David Zhou <David1.Zhou@amd.com>,
 Mario Kleiner <mario.kleiner.de@gmail.com>,
 Thomas Anderson <thomasanderson@google.com>, David Airlie <airlied@linux.ie>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Rm9yIGhpZ2gtcmVzICg4Sykgb3IgSEZSICg0SzEyMCkgZGlzcGxheXMsIHVzaW5nIHVuY29tcHJl
c3NlZCBwaXhlbApmb3JtYXRzIGxpa2UgWUNiQ3I0NDQgd291bGQgZXhjZWVkIHRoZSBiYW5kd2lk
dGggb2YgSERNSSAyLjAsIHNvIHRoZQoiaW50ZXJlc3RpbmciIG1vZGVzIHdvdWxkIGJlIGRpc2Fi
bGVkLCBsZWF2aW5nIG9ubHkgbG93LXJlcyBvciBsb3cKZnJhbWVyYXRlIG1vZGVzLgoKVGhpcyBj
aGFuZ2UgbG93ZXJzIHRoZSBwaXhlbCBlbmNvZGluZyB0byA0OjI6MiBvciA0OjI6MCBpZiB0aGUg
bWF4IFRNRFMKY2xvY2sgaXMgZXhjZWVkZWQuIFZlcmlmaWVkIHRoYXQgOEszMCBhbmQgNEsxMjAg
YXJlIG5vdyBhdmFpbGFibGUgYW5kCndvcmtpbmcgd2l0aCBhIFNhbXN1bmcgUTkwMFIgb3ZlciBh
biBIRE1JIDIuMGIgbGluayBmcm9tIGEgUmFkZW9uIDU3MDAuCgpTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgQW5kZXJzb24gPHRob21hc2FuZGVyc29uQGdvb2dsZS5jb20+Ci0tLQogLi4uL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgMzAgKysrKysrKysrKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKaW5k
ZXggNDEzOWYxMjllYWZiLi5hNTA3YTZmMDRjODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtMzI2OSwxMyArMzI2OSwxNSBA
QCBzdGF0aWMgdm9pZCByZWR1Y2VfbW9kZV9jb2xvdXJfZGVwdGgoc3RydWN0IGRjX2NydGNfdGlt
aW5nICp0aW1pbmdfb3V0KQogCXRpbWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGgtLTsKIH0K
IAotc3RhdGljIHZvaWQgYWRqdXN0X2NvbG91cl9kZXB0aF9mcm9tX2Rpc3BsYXlfaW5mbyhzdHJ1
Y3QgZGNfY3J0Y190aW1pbmcgKnRpbWluZ19vdXQsCi0JCQkJCQljb25zdCBzdHJ1Y3QgZHJtX2Rp
c3BsYXlfaW5mbyAqaW5mbykKK3N0YXRpYyB2b2lkIGFkanVzdF90aW1pbmdfZnJvbV9kaXNwbGF5
X2luZm8oCisJc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmdfb3V0LAorCWNvbnN0IHN0cnVj
dCBkcm1fZGlzcGxheV9pbmZvICppbmZvLAorCWNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
ICptb2RlX2luKQogewogCWludCBub3JtYWxpemVkX2NsazsKLQlpZiAodGltaW5nX291dC0+ZGlz
cGxheV9jb2xvcl9kZXB0aCA8PSBDT0xPUl9ERVBUSF84ODgpCisJaWYgKHRpbWluZ19vdXQtPmRp
c3BsYXlfY29sb3JfZGVwdGggPCBDT0xPUl9ERVBUSF84ODgpCiAJCXJldHVybjsKLQlkbyB7CisJ
d2hpbGUgKHRpbWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGggPiBDT0xPUl9ERVBUSF84ODgp
IHsKIAkJbm9ybWFsaXplZF9jbGsgPSB0aW1pbmdfb3V0LT5waXhfY2xrXzEwMGh6IC8gMTA7CiAJ
CS8qIFlDYkNyIDQ6MjowIHJlcXVpcmVzIGFkZGl0aW9uYWwgYWRqdXN0bWVudCBvZiAxLzIgKi8K
IAkJaWYgKHRpbWluZ19vdXQtPnBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNS
NDIwKQpAQCAtMzI5Nyw5ICszMjk5LDIzIEBAIHN0YXRpYyB2b2lkIGFkanVzdF9jb2xvdXJfZGVw
dGhfZnJvbV9kaXNwbGF5X2luZm8oc3RydWN0IGRjX2NydGNfdGltaW5nICp0aW1pbmdfCiAJCWlm
IChub3JtYWxpemVkX2NsayA8PSBpbmZvLT5tYXhfdG1kc19jbG9jaykKIAkJCXJldHVybjsKIAkJ
cmVkdWNlX21vZGVfY29sb3VyX2RlcHRoKHRpbWluZ19vdXQpOworCX0KIAotCX0gd2hpbGUgKHRp
bWluZ19vdXQtPmRpc3BsYXlfY29sb3JfZGVwdGggPiBDT0xPUl9ERVBUSF84ODgpOwotCisJLyog
VGhlIGNvbG9yIGRlcHRoIGlzIDg4OCBhbmQgY2Fubm90IGJlIHJlZHVjZWQgYW55IGZ1cnRoZXIs
IGJ1dCB0aGUKKwkgKiBjbG9jayB3b3VsZCBzdGlsbCBleGNlZWQgdGhlIG1heCB0bWRzIGNsb2Nr
LiBUcnkgcmVkdWNpbmcgdGhlIHBpeGVsCisJICogZW5jb2RpbmcgbmV4dC4KKwkgKi8KKwlpZiAo
dGltaW5nX291dC0+cGl4ZWxfZW5jb2RpbmcgPT0gUElYRUxfRU5DT0RJTkdfUkdCIHx8CisJICAg
IHRpbWluZ19vdXQtPnBpeGVsX2VuY29kaW5nID09IFBJWEVMX0VOQ09ESU5HX1lDQkNSNDQ0KSB7
CisJCS8qIFlDQkNSNDIyIGlzIGFsd2F5cyBzdXBwb3J0ZWQuICovCisJCXRpbWluZ19vdXQtPnBp
eGVsX2VuY29kaW5nID0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjI7CisJCW5vcm1hbGl6ZWRfY2xr
ID0gKHRpbWluZ19vdXQtPnBpeF9jbGtfMTAwaHogKiAzKSAvIDQwOworCQlpZiAobm9ybWFsaXpl
ZF9jbGsgPD0gaW5mby0+bWF4X3RtZHNfY2xvY2spCisJCQlyZXR1cm47CisJfQorCS8qIFlDQkNS
NDIwIG1heSBvbmx5IGJlIHN1cHBvcnRlZCBvbiBzcGVjaWZpYyBtb2Rlcy4gKi8KKwlpZiAoZHJt
X21vZGVfaXNfNDIwX2Fsc28oaW5mbywgbW9kZV9pbikpCisJCXRpbWluZ19vdXQtPnBpeGVsX2Vu
Y29kaW5nID0gUElYRUxfRU5DT0RJTkdfWUNCQ1I0MjA7CiB9CiAKIHN0YXRpYyB2b2lkIGZpbGxf
c3RyZWFtX3Byb3BlcnRpZXNfZnJvbV9kcm1fZGlzcGxheV9tb2RlKApAQCAtMzM2Niw3ICszMzgy
LDcgQEAgc3RhdGljIHZvaWQgZmlsbF9zdHJlYW1fcHJvcGVydGllc19mcm9tX2RybV9kaXNwbGF5
X21vZGUoCiAJc3RyZWFtLT5vdXRfdHJhbnNmZXJfZnVuYy0+dHlwZSA9IFRGX1RZUEVfUFJFREVG
SU5FRDsKIAlzdHJlYW0tPm91dF90cmFuc2Zlcl9mdW5jLT50ZiA9IFRSQU5TRkVSX0ZVTkNUSU9O
X1NSR0I7CiAJaWYgKHN0cmVhbS0+c2lnbmFsID09IFNJR05BTF9UWVBFX0hETUlfVFlQRV9BKQot
CQlhZGp1c3RfY29sb3VyX2RlcHRoX2Zyb21fZGlzcGxheV9pbmZvKHRpbWluZ19vdXQsIGluZm8p
OworCQlhZGp1c3RfdGltaW5nX2Zyb21fZGlzcGxheV9pbmZvKHRpbWluZ19vdXQsIGluZm8sIG1v
ZGVfaW4pOwogfQogCiBzdGF0aWMgdm9pZCBmaWxsX2F1ZGlvX2luZm8oc3RydWN0IGF1ZGlvX2lu
Zm8gKmF1ZGlvX2luZm8sCi0tIAoyLjI0LjAuNDMyLmc5ZDNmNWY1YjYzLWdvb2cKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBs
aXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
