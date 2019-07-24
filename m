Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23994730F8
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C10926E598;
	Wed, 24 Jul 2019 14:05:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD1188BE3;
 Wed, 24 Jul 2019 14:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id E8DD227FB86
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 20/24] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
Date: Wed, 24 Jul 2019 15:59:42 +0200
Message-Id: <84d189a3c31563c2adee4a9861924d1c7bc2afb5.1563960855.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1563960855.git.andrzej.p@collabora.com>
References: <cover.1563960855.git.andrzej.p@collabora.com>
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
Cc: amd-gfx@lists.freedesktop.org, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
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
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 CK Hu <ck.hu@mediatek.com>, Dave Airlie <airlied@redhat.com>,
 intel-gfx@lists.freedesktop.org, Shashank Sharma <shashank.sharma@intel.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwgNDYg
KysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
LCAyMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRt
aS5jCmluZGV4IDIxOGE3YjIzMDhmNy4uMWZmNmQyY2Y2ZjNhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwpAQCAtMTYxLDcgKzE2MSw2IEBAIHN0cnVjdCBkd19o
ZG1pIHsKIAogCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHByZXZpb3VzX21vZGU7CiAKLQlzdHJ1
Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAl2b2lkIF9faW9tZW0gKnJlZ3M7CiAJYm9vbCBzaW5rX2lz
X2hkbWk7CiAJYm9vbCBzaW5rX2hhc19hdWRpbzsKQEAgLTExMzMsNyArMTEzMiw3IEBAIHN0YXRp
YyBib29sIGR3X2hkbWlfc3VwcG9ydF9zY2RjKHN0cnVjdCBkd19oZG1pICpoZG1pKQogCQlyZXR1
cm4gZmFsc2U7CiAKIAkvKiBEaXNhYmxlIGlmIG5vIEREQyBidXMgKi8KLQlpZiAoIWhkbWktPmRk
YykKKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpCiAJCXJldHVybiBmYWxzZTsKIAogCS8qIERp
c2FibGUgaWYgU0NEQyBpcyBub3Qgc3VwcG9ydGVkLCBvciBpZiBhbiBIRi1WU0RCIGJsb2NrIGlz
IGFic2VudCAqLwpAQCAtMTE3MSwxMCArMTE3MCwxMSBAQCB2b2lkIGR3X2hkbWlfc2V0X2hpZ2hf
dG1kc19jbG9ja19yYXRpbyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKIAogCS8qIENvbnRyb2wgZm9y
IFRNRFMgQml0IFBlcmlvZC9UTURTIENsb2NrLVBlcmlvZCBSYXRpbyAqLwogCWlmIChkd19oZG1p
X3N1cHBvcnRfc2NkYyhoZG1pKSkgeworCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IGhkbWkt
PmNvbm5lY3Rvci5kZGM7CiAJCWlmIChtdG1kc2Nsb2NrID4gSERNSTE0X01BWF9UTURTQ0xLKQot
CQkJZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhoZG1pLT5kZGMsIDEpOworCQkJ
ZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhkZGMsIDEpOwogCQllbHNlCi0JCQlk
cm1fc2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGhkbWktPmRkYywgMCk7CisJCQlkcm1f
c2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGRkYywgMCk7CiAJfQogfQogRVhQT1JUX1NZ
TUJPTF9HUEwoZHdfaGRtaV9zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKTsKQEAgLTE3NjUsNiAr
MTc2NSw3IEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZfY29tcG9zZXIoc3RydWN0IGR3X2hkbWkgKmhk
bWksCiAJaWYgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhkbWkpKSB7CiAJCWlmICh2bW9kZS0+bXRt
ZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NMSyB8fAogCQkgICAgaGRtaV9pbmZvLT5zY2RjLnNj
cmFtYmxpbmcubG93X3JhdGVzKSB7CisJCQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IGhkbWkt
PmNvbm5lY3Rvci5kZGM7CiAJCQkvKgogCQkJICogSERNSTIuMCBTcGVjaWZpZXMgdGhlIGZvbGxv
d2luZyBwcm9jZWR1cmU6CiAJCQkgKiBBZnRlciB0aGUgU291cmNlIERldmljZSBoYXMgZGV0ZXJt
aW5lZCB0aGF0CkBAIC0xNzc0LDEzICsxNzc1LDEyIEBAIHN0YXRpYyB2b2lkIGhkbWlfYXZfY29t
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
dSBtdXN0IGVuc3VyZQpAQCAtMTc5Niw3ICsxNzk2LDcgQEAgc3RhdGljIHZvaWQgaGRtaV9hdl9j
b21wb3NlcihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwKIAkJCWhkbWlfd3JpdGViKGhkbWksIDAsIEhE
TUlfRkNfU0NSQU1CTEVSX0NUUkwpOwogCQkJaGRtaV93cml0ZWIoaGRtaSwgKHU4KX5IRE1JX01D
X1NXUlNUWl9UTURTU1dSU1RfUkVRLAogCQkJCSAgICBIRE1JX01DX1NXUlNUWik7Ci0JCQlkcm1f
c2NkY19zZXRfc2NyYW1ibGluZyhoZG1pLT5kZGMsIDApOworCQkJZHJtX3NjZGNfc2V0X3NjcmFt
YmxpbmcoaGRtaS0+Y29ubmVjdG9yLmRkYywgMCk7CiAJCX0KIAl9CiAKQEAgLTIxNDIsMTAgKzIx
NDIsMTAgQEAgc3RhdGljIGludCBkd19oZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZWRpZCAqZWRpZDsKIAlpbnQgcmV0ID0g
MDsKIAotCWlmICghaGRtaS0+ZGRjKQorCWlmICghaGRtaS0+Y29ubmVjdG9yLmRkYykKIAkJcmV0
dXJuIDA7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+ZGRjKTsKKwll
ZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+Y29ubmVjdG9yLmRkYyk7CiAJaWYg
KGVkaWQpIHsKIAkJZGV2X2RiZyhoZG1pLT5kZXYsICJnb3QgZWRpZDogd2lkdGhbJWRdIHggaGVp
Z2h0WyVkXVxuIiwKIAkJCWVkaWQtPndpZHRoX2NtLCBlZGlkLT5oZWlnaHRfY20pOwpAQCAtMjIw
MCw4ICsyMjAwLDEwIEBAIHN0YXRpYyBpbnQgZHdfaGRtaV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBk
cm1fYnJpZGdlICpicmlkZ2UpCiAKIAlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoY29ubmVjdG9y
LCAmZHdfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAotCWRybV9jb25uZWN0b3JfaW5p
dChicmlkZ2UtPmRldiwgY29ubmVjdG9yLCAmZHdfaGRtaV9jb25uZWN0b3JfZnVuY3MsCi0JCQkg
ICBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2Rk
YyhicmlkZ2UtPmRldiwgY29ubmVjdG9yLAorCQkJCSAgICAmZHdfaGRtaV9jb25uZWN0b3JfZnVu
Y3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9IRE1JQSwKKwkJCQkgICAgY29ubmVjdG9y
LT5kZGMpOwogCiAJZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5jb2Rlcihjb25uZWN0b3IsIGVuY29k
ZXIpOwogCkBAIC0yNTYzLDkgKzI1NjUsOSBAQCBfX2R3X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldiwKIAogCWRkY19ub2RlID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImRk
Yy1pMmMtYnVzIiwgMCk7CiAJaWYgKGRkY19ub2RlKSB7Ci0JCWhkbWktPmRkYyA9IG9mX2dldF9p
MmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsKKwkJaGRtaS0+Y29ubmVjdG9yLmRkYyA9IG9m
X2dldF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsKIAkJb2Zfbm9kZV9wdXQoZGRjX25v
ZGUpOwotCQlpZiAoIWhkbWktPmRkYykgeworCQlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpIHsK
IAkJCWRldl9kYmcoaGRtaS0+ZGV2LCAiZmFpbGVkIHRvIHJlYWQgZGRjIG5vZGVcbiIpOwogCQkJ
cmV0dXJuIEVSUl9QVFIoLUVQUk9CRV9ERUZFUik7CiAJCX0KQEAgLTI3MDQsNyArMjcwNiw3IEBA
IF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCWhkbWlfaW5p
dF9jbGtfcmVnZW5lcmF0b3IoaGRtaSk7CiAKIAkvKiBJZiBEREMgYnVzIGlzIG5vdCBzcGVjaWZp
ZWQsIHRyeSB0byByZWdpc3RlciBIRE1JIEkyQyBidXMgKi8KLQlpZiAoIWhkbWktPmRkYykgewor
CWlmICghaGRtaS0+Y29ubmVjdG9yLmRkYykgewogCQkvKiBMb29rIGZvciAob3B0aW9uYWwpIHN0
dWZmIHJlbGF0ZWQgdG8gdW53ZWRnaW5nICovCiAJCWhkbWktPnBpbmN0cmwgPSBkZXZtX3BpbmN0
cmxfZ2V0KGRldik7CiAJCWlmICghSVNfRVJSKGhkbWktPnBpbmN0cmwpKSB7CkBAIC0yNzIzLDkg
KzI3MjUsOSBAQCBfX2R3X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwK
IAkJCX0KIAkJfQogCi0JCWhkbWktPmRkYyA9IGR3X2hkbWlfaTJjX2FkYXB0ZXIoaGRtaSk7Ci0J
CWlmIChJU19FUlIoaGRtaS0+ZGRjKSkKLQkJCWhkbWktPmRkYyA9IE5VTEw7CisJCWhkbWktPmNv
bm5lY3Rvci5kZGMgPSBkd19oZG1pX2kyY19hZGFwdGVyKGhkbWkpOworCQlpZiAoSVNfRVJSKGhk
bWktPmNvbm5lY3Rvci5kZGMpKQorCQkJaGRtaS0+Y29ubmVjdG9yLmRkYyA9IE5VTEw7CiAJfQog
CiAJaGRtaS0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gaGRtaTsKQEAgLTI3OTEsNyArMjc5Myw3
IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogZXJyX2lh
aGI6CiAJaWYgKGhkbWktPmkyYykgewogCQlpMmNfZGVsX2FkYXB0ZXIoJmhkbWktPmkyYy0+YWRh
cCk7Ci0JCWhkbWktPmRkYyA9IE5VTEw7CisJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBOVUxMOwog
CX0KIAogCWlmIChoZG1pLT5jZWNfbm90aWZpZXIpCkBAIC0yODAzLDcgKzI4MDUsNyBAQCBfX2R3
X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKIGVycl9pc2ZyOgogCWNs
a19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5pc2ZyX2Nsayk7CiBlcnJfcmVzOgotCWkyY19wdXRf
YWRhcHRlcihoZG1pLT5kZGMpOworCWkyY19wdXRfYWRhcHRlcihoZG1pLT5jb25uZWN0b3IuZGRj
KTsKIAogCXJldHVybiBFUlJfUFRSKHJldCk7CiB9CkBAIC0yODI5LDcgKzI4MzEsNyBAQCBzdGF0
aWMgdm9pZCBfX2R3X2hkbWlfcmVtb3ZlKHN0cnVjdCBkd19oZG1pICpoZG1pKQogCWlmIChoZG1p
LT5pMmMpCiAJCWkyY19kZWxfYWRhcHRlcigmaGRtaS0+aTJjLT5hZGFwKTsKIAllbHNlCi0JCWky
Y19wdXRfYWRhcHRlcihoZG1pLT5kZGMpOworCQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVj
dG9yLmRkYyk7CiB9CiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCi0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGlu
ZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
