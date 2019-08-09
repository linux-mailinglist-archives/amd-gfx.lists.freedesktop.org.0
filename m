Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947FC87EBC
	for <lists+amd-gfx@lfdr.de>; Fri,  9 Aug 2019 17:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A9906EE3F;
	Fri,  9 Aug 2019 15:58:43 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp12.smtpout.orange.fr
 [80.12.242.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AC76EE33
 for <amd-gfx@lists.freedesktop.org>; Fri,  9 Aug 2019 15:47:17 +0000 (UTC)
Received: from localhost.localdomain ([92.140.207.10]) by mwinf5d35 with ME
 id n3nC2000S0Dzhgk033nCfu; Fri, 09 Aug 2019 17:47:14 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Fri, 09 Aug 2019 17:47:14 +0200
X-ME-IP: 92.140.207.10
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, David1.Zhou@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, nicholas.kazlauskas@amd.com, David.Francis@amd.com,
 mario.kleiner.de@gmail.com, Bhawanpreet.Lakha@amd.com, Anthony.Koo@amd.com
Subject: [PATCH] drm/amd/display: Fix a typo - amdpgu_dm --> amdgpu_dm
Date: Fri,  9 Aug 2019 17:46:16 +0200
Message-Id: <20190809154616.25479-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 09 Aug 2019 15:58:41 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VGhpcyBzaG91bGQgYmUgJ2FtZGdwdV9kbScsIG5vdCAnYW1kcGd1X2RtJwoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNCAr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmlu
ZGV4IDMzMmFjOWQ5ODVmMi4uMWNjZDBlNGQ0NTlmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKQEAgLTgzNiw3ICs4MzYsNyBAQCBz
dGF0aWMgdm9pZCBzM19oYW5kbGVfbXN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGJvb2wgc3Vz
cGVuZCkKIAogLyoqCiAgKiBkbV9od19pbml0KCkgLSBJbml0aWFsaXplIERDIGRldmljZQotICog
QGhhbmRsZTogVGhlIGJhc2UgZHJpdmVyIGRldmljZSBjb250YWluaW5nIHRoZSBhbWRwZ3VfZG0g
ZGV2aWNlLgorICogQGhhbmRsZTogVGhlIGJhc2UgZHJpdmVyIGRldmljZSBjb250YWluaW5nIHRo
ZSBhbWRncHVfZG0gZGV2aWNlLgogICoKICAqIEluaXRpYWxpemUgdGhlICZzdHJ1Y3QgYW1kZ3B1
X2Rpc3BsYXlfbWFuYWdlciBkZXZpY2UuIFRoaXMgaW52b2x2ZXMgY2FsbGluZwogICogdGhlIGlu
aXRpYWxpemVycyBvZiBlYWNoIERNIGNvbXBvbmVudCwgdGhlbiBwb3B1bGF0aW5nIHRoZSBzdHJ1
Y3Qgd2l0aCB0aGVtLgpAQCAtODY2LDcgKzg2Niw3IEBAIHN0YXRpYyBpbnQgZG1faHdfaW5pdCh2
b2lkICpoYW5kbGUpCiAKIC8qKgogICogZG1faHdfZmluaSgpIC0gVGVhcmRvd24gREMgZGV2aWNl
Ci0gKiBAaGFuZGxlOiBUaGUgYmFzZSBkcml2ZXIgZGV2aWNlIGNvbnRhaW5pbmcgdGhlIGFtZHBn
dV9kbSBkZXZpY2UuCisgKiBAaGFuZGxlOiBUaGUgYmFzZSBkcml2ZXIgZGV2aWNlIGNvbnRhaW5p
bmcgdGhlIGFtZGdwdV9kbSBkZXZpY2UuCiAgKgogICogVGVhcmRvd24gY29tcG9uZW50cyB3aXRo
aW4gJnN0cnVjdCBhbWRncHVfZGlzcGxheV9tYW5hZ2VyIHRoYXQgcmVxdWlyZQogICogY2xlYW51
cC4gVGhpcyBpbnZvbHZlcyBjbGVhbmluZyB1cCB0aGUgRFJNIGRldmljZSwgREMsIGFuZCBhbnkg
bW9kdWxlcyB0aGF0Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
