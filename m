Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1483730D0
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B51F6E57E;
	Wed, 24 Jul 2019 14:03:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7C26E579;
 Wed, 24 Jul 2019 14:03:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id CD83627E5D2
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 14/24] drm: zte: Provide ddc symlink in vga connector sysfs
 directory
Date: Wed, 24 Jul 2019 15:59:36 +0200
Message-Id: <be7b7fc2e0b4e653e378a8e889c6f16c5bd47d1e.1563960855.git.andrzej.p@collabora.com>
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
Cc: "Y.C. Chen" <yc_chen@aspeedtech.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Douglas Anderson <dianders@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
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
 Harry Wentland <harry.wentland@amd.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Jernej Skrabec <jernej.skrabec@siol.net>, amd-gfx@lists.freedesktop.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Eric Anholt <eric@anholt.net>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 linux-kernel@vger.kernel.org, Todor Tomov <todor.tomov@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Huang Rui <ray.huang@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

VXNlIHRoZSBkZGMgcG9pbnRlciBwcm92aWRlZCBieSB0aGUgZ2VuZXJpYyBjb25uZWN0b3IuCgpT
aWduZWQtb2ZmLWJ5OiBBbmRyemVqIFBpZXRyYXNpZXdpY3ogPGFuZHJ6ZWoucEBjb2xsYWJvcmEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfdmdhLmMgfCAzMSArKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTgg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYyBi
L2RyaXZlcnMvZ3B1L2RybS96dGUvenhfdmdhLmMKaW5kZXggOWI2N2U0MTkyODBjLi4xYmM2ZTli
Y2U3ZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS96dGUvenhfdmdhLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3p0ZS96eF92Z2EuYwpAQCAtMjUsMTUgKzI1LDExIEBAIHN0cnVjdCB6eF92
Z2FfcHdyY3RybCB7CiAJdTMyIG1hc2s7CiB9OwogCi1zdHJ1Y3QgenhfdmdhX2kyYyB7Ci0Jc3Ry
dWN0IGkyY19hZGFwdGVyIGFkYXA7Ci0Jc3RydWN0IG11dGV4IGxvY2s7Ci19OwotCiBzdHJ1Y3Qg
enhfdmdhIHsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciBjb25uZWN0b3I7CiAJc3RydWN0IGRybV9l
bmNvZGVyIGVuY29kZXI7Ci0Jc3RydWN0IHp4X3ZnYV9pMmMgKmRkYzsKKwkvKiBwcm90ZWN0cyBk
ZGMgYWNjZXNzICovCisJc3RydWN0IG11dGV4IGRkY19sb2NrOwogCXN0cnVjdCBkZXZpY2UgKmRl
djsKIAl2b2lkIF9faW9tZW0gKm1taW87CiAJc3RydWN0IGNsayAqaTJjX3djbGs7CkBAIC04OCw3
ICs4NCw3IEBAIHN0YXRpYyBpbnQgenhfdmdhX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAkgKi8KIAl6eF93cml0ZWwodmdhLT5tbWlvICsgVkdB
X0FVVE9fREVURUNUX1NFTCwgMCk7CiAKLQllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3Rvciwg
JnZnYS0+ZGRjLT5hZGFwKTsKKwllZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgY29ubmVj
dG9yLT5kZGMpOwogCWlmICghZWRpZCkgewogCQkvKgogCQkgKiBJZiBFRElEIHJlYWRpbmcgZmFp
bHMsIHdlIHNldCB0aGUgZGV2aWNlIHN0YXRlIGludG8KQEAgLTE2NSw4ICsxNjEsMTAgQEAgc3Rh
dGljIGludCB6eF92Z2FfcmVnaXN0ZXIoc3RydWN0IGRybV9kZXZpY2UgKmRybSwgc3RydWN0IHp4
X3ZnYSAqdmdhKQogCiAJdmdhLT5jb25uZWN0b3IucG9sbGVkID0gRFJNX0NPTk5FQ1RPUl9QT0xM
X0hQRDsKIAotCXJldCA9IGRybV9jb25uZWN0b3JfaW5pdChkcm0sIGNvbm5lY3RvciwgJnp4X3Zn
YV9jb25uZWN0b3JfZnVuY3MsCi0JCQkJIERSTV9NT0RFX0NPTk5FQ1RPUl9WR0EpOworCXJldCA9
IGRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkcm0sIGNvbm5lY3RvciwKKwkJCQkJICAmenhf
dmdhX2Nvbm5lY3Rvcl9mdW5jcywKKwkJCQkJICBEUk1fTU9ERV9DT05ORUNUT1JfVkdBLAorCQkJ
CQkgIGNvbm5lY3Rvci0+ZGRjKTsKIAlpZiAocmV0KSB7CiAJCURSTV9ERVZfRVJST1IoZGV2LCAi
ZmFpbGVkIHRvIGluaXQgY29ubmVjdG9yOiAlZFxuIiwgcmV0KTsKIAkJZ290byBjbGVhbl9lbmNv
ZGVyOwpAQCAtMjg0LDExICsyODIsMTAgQEAgc3RhdGljIGludCB6eF92Z2FfaTJjX3hmZXIoc3Ry
dWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywKIAkJCSAgIGludCBu
dW0pCiB7CiAJc3RydWN0IHp4X3ZnYSAqdmdhID0gaTJjX2dldF9hZGFwZGF0YShhZGFwKTsKLQlz
dHJ1Y3QgenhfdmdhX2kyYyAqZGRjID0gdmdhLT5kZGM7CiAJaW50IHJldCA9IDA7CiAJaW50IGk7
CiAKLQltdXRleF9sb2NrKCZkZGMtPmxvY2spOworCW11dGV4X2xvY2soJnZnYS0+ZGRjX2xvY2sp
OwogCiAJZm9yIChpID0gMDsgaSA8IG51bTsgaSsrKSB7CiAJCWlmIChtc2dzW2ldLmZsYWdzICYg
STJDX01fUkQpCkBAIC0zMDMsNyArMzAwLDcgQEAgc3RhdGljIGludCB6eF92Z2FfaTJjX3hmZXIo
c3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJjX21zZyAqbXNncywKIAlpZiAoIXJl
dCkKIAkJcmV0ID0gbnVtOwogCi0JbXV0ZXhfdW5sb2NrKCZkZGMtPmxvY2spOworCW11dGV4X3Vu
bG9jaygmdmdhLT5kZGNfbG9jayk7CiAKIAlyZXR1cm4gcmV0OwogfQpAQCAtMzIyLDE3ICszMTks
MTUgQEAgc3RhdGljIGludCB6eF92Z2FfZGRjX3JlZ2lzdGVyKHN0cnVjdCB6eF92Z2EgKnZnYSkK
IHsKIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB2Z2EtPmRldjsKIAlzdHJ1Y3QgaTJjX2FkYXB0ZXIg
KmFkYXA7Ci0Jc3RydWN0IHp4X3ZnYV9pMmMgKmRkYzsKIAlpbnQgcmV0OwogCi0JZGRjID0gZGV2
bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkZGMpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWRkYykKKwlh
ZGFwID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCphZGFwKSwgR0ZQX0tFUk5FTCk7CisJaWYg
KCFhZGFwKQogCQlyZXR1cm4gLUVOT01FTTsKIAotCXZnYS0+ZGRjID0gZGRjOwotCW11dGV4X2lu
aXQoJmRkYy0+bG9jayk7CisJdmdhLT5jb25uZWN0b3IuZGRjID0gYWRhcDsKKwltdXRleF9pbml0
KCZ2Z2EtPmRkY19sb2NrKTsKIAotCWFkYXAgPSAmZGRjLT5hZGFwOwogCWFkYXAtPm93bmVyID0g
VEhJU19NT0RVTEU7CiAJYWRhcC0+Y2xhc3MgPSBJMkNfQ0xBU1NfRERDOwogCWFkYXAtPmRldi5w
YXJlbnQgPSBkZXY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
YW1kLWdmeA==
