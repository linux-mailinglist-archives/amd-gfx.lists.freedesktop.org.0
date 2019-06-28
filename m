Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC45A0F2
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 375806E975;
	Fri, 28 Jun 2019 16:32:06 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DEC6E95B;
 Fri, 28 Jun 2019 16:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 7144F289CEB
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/22] drm/vc4: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 28 Jun 2019 18:01:25 +0200
Message-Id: <980ef1af2d03820f2f55f42547664ed08f75e3e7.1561735433.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <3fb19371-db7d-f9dc-31a7-1ccd126f6784@collabora.com>
 <cover.1561735433.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1561735433.git.andrzej.p@collabora.com>
References: <cover.1561735433.git.andrzej.p@collabora.com>
X-Mailman-Approved-At: Fri, 28 Jun 2019 16:31:43 +0000
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 linux-rockchip@lists.infradead.org, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alex Deucher <alexander.deucher@amd.com>, Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYyB8IDE2ICsrKysrKysrKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfaGRtaS5jCmluZGV4IDg3YWQwODc5ZWRmMy4uYjQ2ZGYzYWExNzk4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfaGRtaS5jCkBAIC03NSw3ICs3NSw2IEBAIHN0cnVjdCB2YzRfaGRtaSB7CiAK
IAlzdHJ1Y3QgdmM0X2hkbWlfYXVkaW8gYXVkaW87CiAKLQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRk
YzsKIAl2b2lkIF9faW9tZW0gKmhkbWljb3JlX3JlZ3M7CiAJdm9pZCBfX2lvbWVtICpoZF9yZWdz
OwogCWludCBocGRfZ3BpbzsKQEAgLTIwNiw3ICsyMDUsNyBAQCB2YzRfaGRtaV9jb25uZWN0b3Jf
ZGV0ZWN0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiAJCXJl
dHVybiBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZDsKIAl9CiAKLQlpZiAoZHJtX3Byb2Jl
X2RkYyh2YzQtPmhkbWktPmRkYykpCisJaWYgKGRybV9wcm9iZV9kZGMoY29ubmVjdG9yLT5kZGMp
KQogCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQ7CiAKIAlpZiAoSERNSV9SRUFE
KFZDNF9IRE1JX0hPVFBMVUcpICYgVkM0X0hETUlfSE9UUExVR19DT05ORUNURUQpCkBAIC0yMzIs
NyArMjMxLDcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9jb25uZWN0b3JfZ2V0X21vZGVzKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiAJaW50IHJldCA9IDA7CiAJc3RydWN0IGVkaWQg
KmVkaWQ7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgdmM0LT5oZG1pLT5kZGMp
OworCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRkYyk7CiAJY2Vj
X3NfcGh5c19hZGRyX2Zyb21fZWRpZCh2YzQtPmhkbWktPmNlY19hZGFwLCBlZGlkKTsKIAlpZiAo
IWVkaWQpCiAJCXJldHVybiAtRU5PREVWOwpAQCAtMTI4Nyw2ICsxMjg2LDcgQEAgc3RhdGljIGlu
dCB2YzRfaGRtaV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVy
LCB2b2lkICpkYXRhKQogCXN0cnVjdCB2YzRfaGRtaSAqaGRtaTsKIAlzdHJ1Y3QgdmM0X2hkbWlf
ZW5jb2RlciAqdmM0X2hkbWlfZW5jb2RlcjsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKmRkY19ub2Rl
OworCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjOwogCXUzMiB2YWx1ZTsKIAlpbnQgcmV0OwogCkBA
IC0xMzM0LDkgKzEzMzQsOSBAQCBzdGF0aWMgaW50IHZjNF9oZG1pX2JpbmQoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIsIHZvaWQgKmRhdGEpCiAJCXJldHVybiAtRU5P
REVWOwogCX0KIAotCWhkbWktPmRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNf
bm9kZSk7CisJZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsKIAlv
Zl9ub2RlX3B1dChkZGNfbm9kZSk7Ci0JaWYgKCFoZG1pLT5kZGMpIHsKKwlpZiAoZGRjKSB7CiAJ
CURSTV9ERUJVRygiRmFpbGVkIHRvIGdldCBkZGMgaTJjIGFkYXB0ZXIgYnkgbm9kZVxuIik7CiAJ
CXJldHVybiAtRVBST0JFX0RFRkVSOwogCX0KQEAgLTEzOTYsNiArMTM5Niw3IEBAIHN0YXRpYyBp
bnQgdmM0X2hkbWlfYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3Rl
ciwgdm9pZCAqZGF0YSkKIAkJcmV0ID0gUFRSX0VSUihoZG1pLT5jb25uZWN0b3IpOwogCQlnb3Rv
IGVycl9kZXN0cm95X2VuY29kZXI7CiAJfQorCWhkbWktPmNvbm5lY3Rvci0+ZGRjID0gZGRjOwog
I2lmZGVmIENPTkZJR19EUk1fVkM0X0hETUlfQ0VDCiAJaGRtaS0+Y2VjX2FkYXAgPSBjZWNfYWxs
b2NhdGVfYWRhcHRlcigmdmM0X2hkbWlfY2VjX2FkYXBfb3BzLAogCQkJCQkgICAgICB2YzQsICJ2
YzQiLApAQCAtMTQ0OCw3ICsxNDQ5LDcgQEAgc3RhdGljIGludCB2YzRfaGRtaV9iaW5kKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCWNsa19k
aXNhYmxlX3VucHJlcGFyZShoZG1pLT5oc21fY2xvY2spOwogCXBtX3J1bnRpbWVfZGlzYWJsZShk
ZXYpOwogZXJyX3B1dF9pMmM6Ci0JcHV0X2RldmljZSgmaGRtaS0+ZGRjLT5kZXYpOworCXB1dF9k
ZXZpY2UoJmRkYy0+ZGV2KTsKIAogCXJldHVybiByZXQ7CiB9CkBAIC0xNDU5LDYgKzE0NjAsNyBA
QCBzdGF0aWMgdm9pZCB2YzRfaGRtaV91bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZGV2aWNlICptYXN0ZXIsCiAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGRldl9nZXRfZHJ2ZGF0
YShtYXN0ZXIpOwogCXN0cnVjdCB2YzRfZGV2ICp2YzQgPSBkcm0tPmRldl9wcml2YXRlOwogCXN0
cnVjdCB2YzRfaGRtaSAqaGRtaSA9IHZjNC0+aGRtaTsKKwlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRk
YyA9IGhkbWktPmNvbm5lY3Rvci0+ZGRjOwogCiAJY2VjX3VucmVnaXN0ZXJfYWRhcHRlcihoZG1p
LT5jZWNfYWRhcCk7CiAJdmM0X2hkbWlfY29ubmVjdG9yX2Rlc3Ryb3koaGRtaS0+Y29ubmVjdG9y
KTsKQEAgLTE0NjcsNyArMTQ2OSw3IEBAIHN0YXRpYyB2b2lkIHZjNF9oZG1pX3VuYmluZChzdHJ1
Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoaGRtaS0+aHNtX2Nsb2NrKTsKIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsKIAotCXB1
dF9kZXZpY2UoJmhkbWktPmRkYy0+ZGV2KTsKKwlwdXRfZGV2aWNlKCZkZGMtPmRldik7CiAKIAl2
YzQtPmhkbWkgPSBOVUxMOwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZng=
