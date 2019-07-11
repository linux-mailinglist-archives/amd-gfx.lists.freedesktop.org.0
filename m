Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB38655A0
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D9C16E204;
	Thu, 11 Jul 2019 11:31:31 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD406E1D7;
 Thu, 11 Jul 2019 11:31:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 2CABF28B698
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 19/23] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Date: Thu, 11 Jul 2019 13:26:46 +0200
Message-Id: <ec88a18feffa37eceb947bb83a6f9f51fb575566.1562843413.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1562843413.git.andrzej.p@collabora.com>
References: <cover.1562843413.git.andrzej.p@collabora.com>
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
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
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
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNDAg
KysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCsp
LCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCmluZGV4IGM2NDkwOTQ5ZDlkYi4uMGI5YzlmMjYxOWRhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTYxLDcgKzE2MSw2IEBAIHN0cnVjdCBkd19o
ZG1pIHsKIAogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHByZXZpb3VzX21vZGU7CiAKLQlzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAl2b2lkIF9faW9tZW0gKnJlZ3M7CiAJYm9vbCBzaW5rX2lz
X2hkbWk7CiAJYm9vbCBzaW5rX2hhc19hdWRpbzsKQEAgLTExMTgsNyArMTExNyw3IEBAIHN0YXRp
YyBib29sIGR3X2hkbWlfc3VwcG9ydF9zY2RjKHN0cnVjdCBkd19oZG1pICpoZG1pKQogCQlyZXR1
cm4gZmFsc2U7CiAKIAkvKiBEaXNhYmxlIGlmIG5vIEREQyBidXMgKi8KLQlpZiAoIWhkbWktPmRk
YykKKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpCiAJCXJldHVybiBmYWxzZTsKIAogCS8qIERp
c2FibGUgaWYgU0NEQyBpcyBub3Qgc3VwcG9ydGVkLCBvciBpZiBhbiBIRi1WU0RCIGJsb2NrIGlz
IGFic2VudCAqLwpAQCAtMTE1NiwxMCArMTE1NSwxMSBAQCB2b2lkIGR3X2hkbWlfc2V0X2hpZ2hf
dG1kc19jbG9ja19yYXRpbyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAogCS8qIENvbnRyb2wgZm9y
IFRNRFMgQml0IFBlcmlvZC9UTURTIENsb2NrLVBlcmlvZCBSYXRpbyAqLwogCWlmIChkd19oZG1p
X3N1cHBvcnRfc2NkYyhoZG1pKSkgeworCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IGhkbWkt
PmNvbm5lY3Rvci5kZGM7CiAJCWlmIChtdG1kc2Nsb2NrID4gSERNSTE0X01BWF9UTURTQ0xLKQot
CQkJZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhoZG1pLT5kZGMsIDEpOworCQkJ
ZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhkZGMsIDEpOwogCQllbHNlCi0JCQlk
cm1fc2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGhkbWktPmRkYywgMCk7CisJCQlkcm1f
c2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGRkYywgMCk7CiAJfQogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoZHdfaGRtaV9zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKTsKQEAgLTE3NTAsNiAr
MTc1MCw3IEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZfY29tcG9zZXIoc3RydWN0IGR3X2hkbWkgKmhk
bWksCiAJaWYgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkpKSB7CiAJCWlmICh2bW9kZS0+bXRt
ZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSyB8fAogCQkgICAgaGRtaV9pbmZvLT5zY2RjLnNj
cmFtYmxpbmcubG93X3JhdGVzKSB7CisJCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IGhkbWkt
PmNvbm5lY3Rvci5kZGM7CiAJCQkvKgogCQkJICogSERNSTIuMCBTcGVjaWZpZXMgdGhlIGZvbGxv
d2luZyBwcm9jZWR1cmU6CiAJCQkgKiBBZnRlciB0aGUgU291cmNlIERldmljZSBoYXMgZGV0ZXJt
aW5lZCB0aGF0CkBAIC0xNzU5LDEzICsxNzYwLDEyIEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZfY29t
cG9zZXIoc3RydWN0IGR3X2hkbWkgKmhkbWksCiAJCQkgKiBTb3VyY2UgRGV2aWNlcyBjb21wbGlh
bnQgc2hhbGwgc2V0IHRoZQogCQkJICogU291cmNlIFZlcnNpb24gPSAxLgogCQkJICovCi0JCQlk
cm1fc2NkY19yZWFkYihoZG1pLT5kZGMsIFNDRENfU0lOS19WRVJTSU9OLAotCQkJCSAgICAgICAm
Ynl0ZXMpOwotCQkJZHJtX3NjZGNfd3JpdGViKGhkbWktPmRkYywgU0NEQ19TT1VSQ0VfVkVSU0lP
TiwKKwkJCWRybV9zY2RjX3JlYWRiKGRkYywgU0NEQ19TSU5LX1ZFUlNJT04sICZieXRlcyk7CisJ
CQlkcm1fc2NkY193cml0ZWIoZGRjLCBTQ0RDX1NPVVJDRV9WRVJTSU9OLAogCQkJCW1pbl90KHU4
LCBieXRlcywgU0NEQ19NSU5fU09VUkNFX1ZFUlNJT04pKTsKIAogCQkJLyogRW5hYmxlZCBTY3Jh
bWJsaW5nIGluIHRoZSBTaW5rICovCi0JCQlkcm1fc2NkY19zZXRfc2NyYW1ibGluZyhoZG1pLT5k
ZGMsIDEpOworCQkJZHJtX3NjZGNfc2V0X3NjcmFtYmxpbmcoaGRtaS0+Y29ubmVjdG9yLmRkYywg
MSk7CiAKIAkJCS8qCiAJCQkgKiBUbyBhY3RpdmF0ZSB0aGUgc2NyYW1ibGVyIGZlYXR1cmUsIHlv
dSBtdXN0IGVuc3VyZQpAQCAtMTc4MSw3ICsxNzgxLDcgQEAgc3RhdGljIHZvaWQgaGRtaV9hdl9j
b21wb3NlcihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwKIAkJCWhkbWlfd3JpdGViKGhkbWksIDAsIEhE
TUlfRkNfU0NSQU1CTEVSX0NUUkwpOwogCQkJaGRtaV93cml0ZWIoaGRtaSwgKHU4KX5IRE1JX01D
X1NXUlNUWl9UTURTU1dSU1RfUkVRLAogCQkJCSAgICBIRE1JX01DX1NXUlNUWik7Ci0JCQlkcm1f
c2NkY19zZXRfc2NyYW1ibGluZyhoZG1pLT5kZGMsIDApOworCQkJZHJtX3NjZGNfc2V0X3NjcmFt
YmxpbmcoaGRtaS0+Y29ubmVjdG9yLmRkYywgMCk7CiAJCX0KIAl9CiAKQEAgLTIxMjcsMTAgKzIx
MjcsMTAgQEAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0g
MDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghaGRtaS0+Y29ubmVjdG9yLmRkYykKIAkJcmV0
dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRjKTsKKwll
ZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYg
KGVkaWQpIHsKIAkJZGV2X2RiZyhoZG1pLT5kZXYsICJnb3QgZWRpZDogd2lkdGhbJWRdIHggaGVp
Z2h0WyVkXVxuIiwKIAkJCWVkaWQtPndpZHRoX2NtLCBlZGlkLT5oZWlnaHRfY20pOwpAQCAtMjU0
OCw5ICsyNTQ4LDkgQEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYsCiAKIAlkZGNfbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJkZGMtaTJjLWJ1cyIsIDAp
OwogCWlmIChkZGNfbm9kZSkgewotCQloZG1pLT5kZGMgPSBvZl9nZXRfaTJjX2FkYXB0ZXJfYnlf
bm9kZShkZGNfbm9kZSk7CisJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBvZl9nZXRfaTJjX2FkYXB0
ZXJfYnlfbm9kZShkZGNfbm9kZSk7CiAJCW9mX25vZGVfcHV0KGRkY19ub2RlKTsKLQkJaWYgKCFo
ZG1pLT5kZGMpIHsKKwkJaWYgKCFoZG1pLT5jb25uZWN0b3IuZGRjKSB7CiAJCQlkZXZfZGJnKGhk
bWktPmRldiwgImZhaWxlZCB0byByZWFkIGRkYyBub2RlXG4iKTsKIAkJCXJldHVybiBFUlJfUFRS
KC1FUFJPQkVfREVGRVIpOwogCQl9CkBAIC0yNjg5LDcgKzI2ODksNyBAQCBfX2R3X2hkbWlfcHJv
YmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIAloZG1pX2luaXRfY2xrX3JlZ2VuZXJh
dG9yKGhkbWkpOwogCiAJLyogSWYgRERDIGJ1cyBpcyBub3Qgc3BlY2lmaWVkLCB0cnkgdG8gcmVn
aXN0ZXIgSERNSSBJMkMgYnVzICovCi0JaWYgKCFoZG1pLT5kZGMpIHsKKwlpZiAoIWhkbWktPmNv
bm5lY3Rvci5kZGMpIHsKIAkJLyogTG9vayBmb3IgKG9wdGlvbmFsKSBzdHVmZiByZWxhdGVkIHRv
IHVud2VkZ2luZyAqLwogCQloZG1pLT5waW5jdHJsID0gZGV2bV9waW5jdHJsX2dldChkZXYpOwog
CQlpZiAoIUlTX0VSUihoZG1pLT5waW5jdHJsKSkgewpAQCAtMjcwOCw5ICsyNzA4LDkgQEAgX19k
d19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJCQl9CiAJCX0KIAot
CQloZG1pLT5kZGMgPSBkd19oZG1pX2kyY19hZGFwdGVyKGhkbWkpOwotCQlpZiAoSVNfRVJSKGhk
bWktPmRkYykpCi0JCQloZG1pLT5kZGMgPSBOVUxMOworCQloZG1pLT5jb25uZWN0b3IuZGRjID0g
ZHdfaGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKKwkJaWYgKElTX0VSUihoZG1pLT5jb25uZWN0b3Iu
ZGRjKSkKKwkJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwogCX0KIAogCWhkbWktPmJyaWRn
ZS5kcml2ZXJfcHJpdmF0ZSA9IGhkbWk7CkBAIC0yNzc2LDcgKzI3NzYsNyBAQCBfX2R3X2hkbWlf
cHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIGVycl9pYWhiOgogCWlmIChoZG1p
LT5pMmMpIHsKIAkJaTJjX2RlbF9hZGFwdGVyKCZoZG1pLT5pMmMtPmFkYXApOwotCQloZG1pLT5k
ZGMgPSBOVUxMOworCQloZG1pLT5jb25uZWN0b3IuZGRjID0gTlVMTDsKIAl9CiAKIAlpZiAoaGRt
aS0+Y2VjX25vdGlmaWVyKQpAQCAtMjc4OCw3ICsyNzg4LDcgQEAgX19kd19oZG1pX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiBlcnJfaXNmcjoKIAljbGtfZGlzYWJsZV91bnBy
ZXBhcmUoaGRtaS0+aXNmcl9jbGspOwogZXJyX3JlczoKLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+
ZGRjKTsKKwlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAKIAlyZXR1cm4g
RVJSX1BUUihyZXQpOwogfQpAQCAtMjgxNCw3ICsyODE0LDcgQEAgc3RhdGljIHZvaWQgX19kd19o
ZG1pX3JlbW92ZShzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAlpZiAoaGRtaS0+aTJjKQogCQlpMmNf
ZGVsX2FkYXB0ZXIoJmhkbWktPmkyYy0+YWRhcCk7CiAJZWxzZQotCQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjKTsKKwkJaTJjX3B1dF9hZGFwdGVyKGhkbWktPmNvbm5lY3Rvci5kZGMpOwogfQog
CiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZng=
