Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C077086C
	for <lists+amd-gfx@lfdr.de>; Mon, 22 Jul 2019 20:25:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B132189DC2;
	Mon, 22 Jul 2019 18:25:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 1250 seconds by postgrey-1.36 at gabe;
 Mon, 22 Jul 2019 18:08:11 UTC
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.250])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 353E089D8E
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 18:08:11 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id F32AA400D98AC
 for <amd-gfx@lists.freedesktop.org>; Mon, 22 Jul 2019 12:47:19 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id pcP9hxGIl4FKppcP9h8PMS; Mon, 22 Jul 2019 12:47:19 -0500
X-Authority-Reason: nr=8
Received: from cablelink149-185.telefonia.intercable.net
 ([201.172.149.185]:46480 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hpcP8-001wiZ-Fq; Mon, 22 Jul 2019 12:47:18 -0500
Date: Mon, 22 Jul 2019 12:47:16 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Cox@embeddedor, Philip <Philip.Cox@amd.com>, Liu@embeddedor,
 Shaoyun <Shaoyun.Liu@amd.com>, Oded Gabbay <oded.gabbay@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amdkfd/kfd_mqd_manager_v10: Avoid fall-through warning
Message-ID: <20190722174716.GA17037@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 201.172.149.185
X-Source-L: No
X-Exim-ID: 1hpcP8-001wiZ-Fq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink149-185.telefonia.intercable.net (embeddedor)
 [201.172.149.185]:46480
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 12
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-Mailman-Approved-At: Mon, 22 Jul 2019 18:25:45 +0000
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
Cc: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SW4gcHJlcGFyYXRpb24gdG8gZW5hYmxpbmcgLVdpbXBsaWNpdC1mYWxsdGhyb3VnaCwgdGhpcyBw
YXRjaCBzaWxlbmNlcwp0aGUgZm9sbG93aW5nIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jOiBJbiBmdW5jdGlvbiDigJht
cWRfbWFuYWdlcl9pbml0X3YxMOKAmToKLi9pbmNsdWRlL2xpbnV4L2R5bmFtaWNfZGVidWcuaDox
MjI6NTI6IHdhcm5pbmc6IHRoaXMgc3RhdGVtZW50IG1heSBmYWxsIHRocm91Z2ggWy1XaW1wbGlj
aXQtZmFsbHRocm91Z2g9XQogI2RlZmluZSBfX2R5bmFtaWNfZnVuY19jYWxsKGlkLCBmbXQsIGZ1
bmMsIC4uLikgZG8geyBcCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCi4vaW5jbHVkZS9saW51eC9keW5hbWljX2RlYnVnLmg6MTQzOjI6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2R5bmFtaWNfZnVuY19jYWxs4oCZCiAgX19keW5h
bWljX2Z1bmNfY2FsbChfX1VOSVFVRV9JRChkZGVidWcpLCBmbXQsIGZ1bmMsICMjX19WQV9BUkdT
X18pCiAgXn5+fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvZHluYW1pY19kZWJ1Zy5o
OjE1MzoyOiBub3RlOiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYX2R5bmFtaWNfZnVuY19jYWxs
4oCZCiAgX2R5bmFtaWNfZnVuY19jYWxsKGZtdCwgX19keW5hbWljX3ByX2RlYnVnLCAgXAogIF5+
fn5+fn5+fn5+fn5+fn5+fgouL2luY2x1ZGUvbGludXgvcHJpbnRrLmg6MzM2OjI6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhkeW5hbWljX3ByX2RlYnVn4oCZCiAgZHluYW1pY19wcl9k
ZWJ1ZyhmbXQsICMjX19WQV9BUkdTX18pCiAgXn5+fn5+fn5+fn5+fn5+fgpkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS8uLi9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jOjQzMjozOiBub3Rl
OiBpbiBleHBhbnNpb24gb2YgbWFjcm8g4oCYcHJfZGVidWfigJkKICAgcHJfZGVidWcoIiVzQCVp
XG4iLCBfX2Z1bmNfXywgX19MSU5FX18pOwogICBefn5+fn5+fgpkcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS8uLi9hbWRrZmQva2ZkX21xZF9tYW5hZ2VyX3YxMC5jOjQzMzoyOiBub3RlOiBoZXJl
CiAgY2FzZSBLRkRfTVFEX1RZUEVfQ09NUFVURToKICBefn5+CgpieSByZW1vdmluZyB0aGUgY2Fs
bCB0byBwcl9kZWJ1ZygpIGluIEtGRF9NUURfVFlQRV9DUDoKCiJUaGUgbXFkIGluaXQgZm9yIENQ
IGFuZCBDT01QVVRFIHdpbGwgaGF2ZSB0aGUgc2FtZSAgcm91dGluZS4iIFsxXQoKVGhpcyBidWcg
d2FzIGZvdW5kIHRoYW5rcyB0byB0aGUgb25nb2luZyBlZmZvcnRzIHRvIGVuYWJsZQotV2ltcGxp
Y2l0LWZhbGx0aHJvdWdoLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvYzczNWEx
Y2MtYTU0NS01MGZiLTQ0ZTctYzBhZDkzZWU4ZWU3QGFtZC5jb20vCgpTaWduZWQtb2ZmLWJ5OiBH
dXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvQGVtYmVkZGVkb3IuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAuYyB8IDEgLQogMSBmaWxlIGNo
YW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfbXFkX21hbmFnZXJfdjEwLmMKaW5kZXggNGY4YTZmZmM1Nzc1Li45Y2QzZWIyZDkwYmQgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9tcWRfbWFuYWdlcl92MTAu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwLmMK
QEAgLTQyOSw3ICs0MjksNiBAQCBzdHJ1Y3QgbXFkX21hbmFnZXIgKm1xZF9tYW5hZ2VyX2luaXRf
djEwKGVudW0gS0ZEX01RRF9UWVBFIHR5cGUsCiAKIAlzd2l0Y2ggKHR5cGUpIHsKIAljYXNlIEtG
RF9NUURfVFlQRV9DUDoKLQkJcHJfZGVidWcoIiVzQCVpXG4iLCBfX2Z1bmNfXywgX19MSU5FX18p
OwogCWNhc2UgS0ZEX01RRF9UWVBFX0NPTVBVVEU6CiAJCXByX2RlYnVnKCIlc0AlaVxuIiwgX19m
dW5jX18sIF9fTElORV9fKTsKIAkJbXFkLT5hbGxvY2F0ZV9tcWQgPSBhbGxvY2F0ZV9tcWQ7Ci0t
IAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
