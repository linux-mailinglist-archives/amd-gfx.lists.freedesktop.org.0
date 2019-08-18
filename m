Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0D3918A7
	for <lists+amd-gfx@lfdr.de>; Sun, 18 Aug 2019 20:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE566E03D;
	Sun, 18 Aug 2019 18:13:59 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp06.smtpout.orange.fr
 [80.12.242.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4160D6E07D
 for <amd-gfx@lists.freedesktop.org>; Sun, 18 Aug 2019 16:00:06 +0000 (UTC)
Received: from localhost.localdomain ([92.140.207.10]) by mwinf5d11 with ME
 id qfzz2000v0Dzhgk03g00Jq; Sun, 18 Aug 2019 18:00:04 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 18 Aug 2019 18:00:04 +0200
X-ME-IP: 92.140.207.10
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, xiaojie.yuan@amd.com,
 Hawking.Zhang@amd.com, Jack.Xiao@amd.com
Subject: [PATCH] drm/amdgpu: Fix a typo in the include header guard of
 'navi12_ip_offset.h'
Date: Sun, 18 Aug 2019 17:59:57 +0200
Message-Id: <20190818155957.4029-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 18 Aug 2019 18:13:59 +0000
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

J19uYXZpMTBfaXBfb2Zmc2V0X0hFQURFUicgaXMgYWxyZWFkeSB1c2VkIGluICduYXZpMTBfaXBf
b2Zmc2V0LmgnLCBzbyB1c2UKJ19uYXZpMTJfaXBfb2Zmc2V0X0hFQURFUicgaW5zdGVhZCBoZXJl
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRA
d2FuYWRvby5mcj4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29m
ZnNldC5oIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJf
aXBfb2Zmc2V0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29mZnNl
dC5oCmluZGV4IDIyOWU4ZmRkZmNjMS4uNmMyY2M2Mjk2YzA2IDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2luY2x1ZGUvbmF2aTEyX2lwX29mZnNldC5oCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvaW5jbHVkZS9uYXZpMTJfaXBfb2Zmc2V0LmgKQEAgLTE4LDggKzE4LDggQEAKICAq
IEFOIEFDVElPTiBPRiBDT05UUkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwg
T1VUIE9GIE9SIElOCiAgKiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0Ug
T1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgogICovCi0jaWZuZGVmIF9uYXZpMTBf
aXBfb2Zmc2V0X0hFQURFUgotI2RlZmluZSBfbmF2aTEwX2lwX29mZnNldF9IRUFERVIKKyNpZm5k
ZWYgX25hdmkxMl9pcF9vZmZzZXRfSEVBREVSCisjZGVmaW5lIF9uYXZpMTJfaXBfb2Zmc2V0X0hF
QURFUgogCiAjZGVmaW5lIE1BWF9JTlNUQU5DRSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDcKICNkZWZpbmUgTUFYX1NFR01FTlQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgNQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
