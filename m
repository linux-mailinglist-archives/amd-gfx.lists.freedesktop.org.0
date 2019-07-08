Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0638D61FF6
	for <lists+amd-gfx@lfdr.de>; Mon,  8 Jul 2019 16:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8436489D79;
	Mon,  8 Jul 2019 14:01:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD81D89D56;
 Mon,  8 Jul 2019 13:53:36 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MUTxo-1htFVa4BHs-00QViS; Mon, 08 Jul 2019 15:53:31 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: dcn20: include linux/delay.h
Date: Mon,  8 Jul 2019 15:53:18 +0200
Message-Id: <20190708135329.694852-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:3AQbgHoIbkOa32VoDk5bLzC+5QlQ4gP5p6DVn/CsMDmYXi/m3vL
 3BU/ivzqXjNLdw6xN1FFBUQ+tuVhp1PKBGcs7RmcqllpBPfmKkAvq6E4wGu54wTkaoM/dVH
 dlHE8H/kl1J+q3cngDKcctqTKQVCcr/8GT+crkUtFmxFRKK25L7Yw5J/I4mKE7HpHXlTWMH
 LUFe1p4fz8TwIpDYFPPNA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:P81gE92WStQ=:bH84Tou9LSbpmtFO553fOz
 A6Dgyr8tJZi6gj5u5tpt6WsU8m6Kx+STtblR6JYxgDbz3zHGangCly7WJ7Nxu+EWPt6Ho9als
 m9dL2tSwqpFpiPmeQbZ9+gMfOGnX6eNsgqqERayPBvI7GUmnf2gPrgXW7MguC3PHR/VpmNYUp
 MXEPbPB1B2HaZnjR5iIjKFzPnTAYl3KeANI3jfxMf1PpT4mNvLhPHS46qGSrUynA7/HoHBUO+
 IKpqEAVla65evxD9bAp+UkYWOHTFfzUdaC6MKYLbDPTGhXd5/t+l/wlWmBZOj6RxWkymgo+S+
 gMyktF0RDqB9WhF9IDSqSZHpRxXu1GNHtqghwAP9iuKLFhdeC3Md4DcbCDKWq3zg8Rt2nuUHI
 GcMvOJdh6zcX4gpwI+FvA3qL2HxsPsrEkhS76K/xV7R+GLlCSPSvYMvSXko8tOOParDcfpF4D
 FRhofMcLBx7SaGSmkYIv2mqHehRhioD4BwbxIbXgArV5c7FVZdTwnxX+LJDz7kqxx0Mo2l3TI
 cJ4mGVXKoP0D4NDgjpAdKsgNNFyy9bbs2KsGhpsWwbL1FCUv6iNZkNCBC8kCmeRaq4EoKMUEG
 kWfhC3IlOvRtTS7LCw6p3j4GOxk/lYPCjOqiZhbJPnrqCLxZzqDNqZoEUUQpGbuBkxUUFuks/
 nBK1zS+4/NBZL+KkLATpuci0ibacgIHbiyu+DsIQb8XCHnF1e7WxwwpoIrdQ5cf/9u206wdk9
 KhS8BeTojgu5lfDZNMYvu5xWcVTN7mDYE3DfBQ==
X-Mailman-Approved-At: Mon, 08 Jul 2019 14:00:59 +0000
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
Cc: Joshua Aberback <joshua.aberback@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Wenjing Liu <Wenjing.Liu@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Tony Cheng <Tony.Cheng@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2l0aG91dCB0aGlzIGhlYWRlciwgd2UgZ2V0IGEgY29tcGlsZXIgZXJyb3IgaW4gc29tZSBjb25m
aWd1cmF0aW9uczoKCi4uLi9kYy9kY24yMC9kY24yMF9od3NlcS5jOiBJbiBmdW5jdGlvbiAnZGNu
MjBfaHdzc193YWl0X2Zvcl9ibGFua19jb21wbGV0ZSc6Ci4uLi9kYy9kY24yMC9kY24yMF9od3Nl
cS5jOjE0OTM6MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uICd1ZGVs
YXknIFstV2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQoKTm90ZTogdGhlIHVz
ZSBvZiB1ZGVsYXkgaXRzZWxmIG1heSBiZSBwcm9ibGVtYXRpYywgYXMgY2FuIG9jY3VweQp0aGUg
Q1BVIGZvciAyMDBtcyBpbiBhIGJ1c3ktbG9vcCBoZXJlLgoKRml4ZXM6IDdlZDRlNjM1MmMxNiAo
ImRybS9hbWQvZGlzcGxheTogQWRkIERDTjIgSFcgU2VxdWVuY2VyIGFuZCBSZXNvdXJjZSIpClNp
Z25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMgfCAxICsKIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9kY24yMC9kY24yMF9od3NlcS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2RjbjIwL2RjbjIwX2h3c2VxLmMKaW5kZXggNGIwZDhiOWY2MWRhLi42OTI1ZDI1ZDI0
NTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24y
MF9od3NlcS5jCkBAIC0yMiw2ICsyMiw3IEBACiAgKiBBdXRob3JzOiBBTUQKICAqCiAgKi8KKyNp
bmNsdWRlIDxsaW51eC9kZWxheS5oPgogCiAjaW5jbHVkZSAiZG1fc2VydmljZXMuaCIKICNpbmNs
dWRlICJkbV9oZWxwZXJzLmgiCi0tIAoyLjIwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
