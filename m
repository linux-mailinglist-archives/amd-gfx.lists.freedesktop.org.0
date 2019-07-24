Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F26730E4
	for <lists+amd-gfx@lfdr.de>; Wed, 24 Jul 2019 16:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B056B6E579;
	Wed, 24 Jul 2019 14:04:35 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D1606E579;
 Wed, 24 Jul 2019 14:04:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 909FE27FB86
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 17/24] drm/mgag200: Provide ddc symlink in connector sysfs
 directory
Date: Wed, 24 Jul 2019 15:59:39 +0200
Message-Id: <f86dfa1ed6e84ab8b36a0b2c24df897bdb957294.1563960855.git.andrzej.p@collabora.com>
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIHwgMTMgKysr
KysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCmluZGV4IDgyMmYyYTEzNzQ4
Zi4uNWU3NzhiNWYxYTEwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX21vZGUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYwpA
QCAtMTY3OCwxOCArMTY3OCwxOSBAQCBzdGF0aWMgc3RydWN0IGRybV9jb25uZWN0b3IgKm1nYV92
Z2FfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCQlyZXR1cm4gTlVMTDsKIAogCWNvbm5l
Y3RvciA9ICZtZ2FfY29ubmVjdG9yLT5iYXNlOworCW1nYV9jb25uZWN0b3ItPmkyYyA9IG1nYWcy
MDBfaTJjX2NyZWF0ZShkZXYpOworCWlmICghbWdhX2Nvbm5lY3Rvci0+aTJjKQorCQlEUk1fRVJS
T1IoImZhaWxlZCB0byBhZGQgZGRjIGJ1c1xuIik7CiAKLQlkcm1fY29ubmVjdG9yX2luaXQoZGV2
LCBjb25uZWN0b3IsCi0JCQkgICAmbWdhX3ZnYV9jb25uZWN0b3JfZnVuY3MsIERSTV9NT0RFX0NP
Tk5FQ1RPUl9WR0EpOworCWRybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsIGNvbm5lY3Rv
ciwKKwkJCQkgICAgJm1nYV92Z2FfY29ubmVjdG9yX2Z1bmNzLAorCQkJCSAgICBEUk1fTU9ERV9D
T05ORUNUT1JfVkdBLAorCQkJCSAgICAmbWdhX2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsKIAog
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZChjb25uZWN0b3IsICZtZ2FfdmdhX2Nvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MpOwogCiAJZHJtX2Nvbm5lY3Rvcl9yZWdpc3Rlcihjb25uZWN0b3IpOwogCi0J
bWdhX2Nvbm5lY3Rvci0+aTJjID0gbWdhZzIwMF9pMmNfY3JlYXRlKGRldik7Ci0JaWYgKCFtZ2Ff
Y29ubmVjdG9yLT5pMmMpCi0JCURSTV9FUlJPUigiZmFpbGVkIHRvIGFkZCBkZGMgYnVzXG4iKTsK
LQogCXJldHVybiBjb25uZWN0b3I7CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
