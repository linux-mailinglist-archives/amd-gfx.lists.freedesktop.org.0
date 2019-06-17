Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9122C484E0
	for <lists+amd-gfx@lfdr.de>; Mon, 17 Jun 2019 16:07:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71748923C;
	Mon, 17 Jun 2019 14:07:04 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 308 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2019 12:44:33 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5043089173;
 Mon, 17 Jun 2019 12:44:33 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MkpOZ-1iL19m1NHz-00mJjL; Mon, 17 Jun 2019 14:39:17 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: include missing linux/delay.h
Date: Mon, 17 Jun 2019 14:38:55 +0200
Message-Id: <20190617123915.926526-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:r3X+Mcq4GDZ3qYDRz2Ihhnt91TQ2U5GxOpABsFsYrkC/K9q9h5n
 iCNKaLTm4verJxBR2gbf1xeYHX3t8DdWTTAtUV2POtlSaUwtwRKQpa/71TAsiTm5UPIGKjd
 J+/kRqcTWmqyST8H4wUAR9xdOfp8NF8rU2uoLqYwzwxpz1WNbRaP7oI+RNniNHlcacXAddZ
 P3NzvMWZ/HEnTZr5TlA8Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:aCybWkgEqPQ=:i11s37kAfNwE6L7M7mRbJh
 Q1HJ6Ksz6qlQpwAbEZ1z6npc0GxYuacpyqGKxLf8VQHF6qWSsApmrnnIjoVWnG1y4E/PwJ+Hv
 iGK3My2CqWRJTwUSWqVnX951iuCpaBybDM9u4Zij4ksd7VsqBxw5ALZ4CG90M2eTKJzV8dGi1
 14cFZGue7vkeq3/cLNNUKARp3r04wjV8IM5CPG0KGLuFT6ImE03nbTzRg3pYn2TpjiUEVuX6k
 TuXLBOiuDPZYafb9sDC26mk1PbaZwwTnkppgws7RaPg5rc62MZEBD+tDBnX8aJmdZgu/2ZSV6
 D54F5K7DQCsg6zJvEriA7eZ7Xcv37AwLwwodepzk4s8sBWVU37phiDu8lx30VxZM0sLTCIkBQ
 /G0nbjM7vSM38jUNmu9VF0aQtU3bqtLsM3fCoHIjfMGljje1WT9SSFsr8AeQyiGaHzikWv0Bp
 +njTpf5kGgIofxdHDFWZKeP/w9IVA7suHczxldUvyo5hkUzran1Rmu589OHhEXRzBumxwRT9U
 y21/POODmQqdajwmv9uC//WQVBTHrDGiS6FTEgPaKfaFmfb2ROWGF9BFUvxFcxedzxspzL/V3
 jmKmlOU7FyHc6CtdIW41S0NXSePGbUGmhD4eg1ah3mzEE5xgck4gnkiVlb6hS/uK860oLOsyh
 w5LVYtN+KuT1fJ2k5U9ztXjPFRac3VNoCuS7Z6kPfqoIzaKySOkEqt5HhIm2ILwbr78Lbd1TY
 SFMFaSiZg3/3zcka7MOsIOYDs98iolI4p9EUAg==
X-Mailman-Approved-At: Mon, 17 Jun 2019 14:07:03 +0000
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
Cc: Thomas Lim <Thomas.Lim@amd.com>, Eric Yang <eric.yang2@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Charlene Liu <charlene.liu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Tony Cheng <tony.cheng@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

U29tZSByYW5kY29uZmlnIGJ1aWxkcyBmYWlsIHRvIGNvbXBpbGUgdGhlIGRjbjEwIGNvZGUgYmVj
YXVzZSBvZgphIG1pc3NpbmcgZGVjbGFyYXRpb246Cgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3NlcXVlbmNlci5jOiBJbiBmdW5jdGlvbiAn
ZGNuMTBfYXBwbHlfY3R4X2Zvcl9zdXJmYWNlJzoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
Li4vZGlzcGxheS9kYy9kY24xMC9kY24xMF9od19zZXF1ZW5jZXIuYzoyMzc4OjM6IGVycm9yOiBp
bXBsaWNpdCBkZWNsYXJhdGlvbiBvZiBmdW5jdGlvbiAndWRlbGF5JyBbLVdlcnJvcj1pbXBsaWNp
dC1mdW5jdGlvbi1kZWNsYXJhdGlvbl0KCkluY2x1ZGUgdGhlIGFwcHJvcHJpYXRlIGtlcm5lbCBo
ZWFkZXIuCgpGaXhlczogOWVkNDNlZjg0ZDlkICgiZHJtL2FtZC9kaXNwbGF5OiBBZGQgVW5kZXJm
bG93IEFzc2VydHMgdG8gZGMiKQpTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24xMC9kY24xMF9o
d19zZXF1ZW5jZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3
X3NlcXVlbmNlci5jCmluZGV4IDFhYzlhNGYwMzk5MC4uZDg3ZGRjN2RlOWM2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfaHdfc2VxdWVuY2Vy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2h3X3Nl
cXVlbmNlci5jCkBAIC0yMiw2ICsyMiw3IEBACiAgKiBBdXRob3JzOiBBTUQKICAqCiAgKi8KKyNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgogCiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNs
dWRlICJkbV9zZXJ2aWNlcy5oIgotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
