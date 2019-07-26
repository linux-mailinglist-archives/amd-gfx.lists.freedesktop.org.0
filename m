Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DEB77019
	for <lists+amd-gfx@lfdr.de>; Fri, 26 Jul 2019 19:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3519E6EDFA;
	Fri, 26 Jul 2019 17:27:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC66EDFA;
 Fri, 26 Jul 2019 17:27:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id BC66A28C553
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 17/24] drm/mgag200: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 26 Jul 2019 19:23:11 +0200
Message-Id: <d9e8d4281f6778e5598410a44f1b29c85df1c16d.1564161140.git.andrzej.p@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
References: <cover.1564161140.git.andrzej.p@collabora.com>
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
 Jyri Sarha <jsarha@ti.com>, Vincent Abriou <vincent.abriou@st.com>,
 Rob Clark <robdclark@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Shashank Sharma <shashank.sharma@intel.com>, freedreno@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Y29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMgfCAxMyArKysrKysr
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMKaW5kZXggODIyZjJhMTM3NDhmLi41
ZTc3OGI1ZjFhMTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jCkBAIC0x
Njc4LDE4ICsxNjc4LDE5IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqbWdhX3ZnYV9p
bml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCXJldHVybiBOVUxMOwogCiAJY29ubmVjdG9y
ID0gJm1nYV9jb25uZWN0b3ItPmJhc2U7CisJbWdhX2Nvbm5lY3Rvci0+aTJjID0gbWdhZzIwMF9p
MmNfY3JlYXRlKGRldik7CisJaWYgKCFtZ2FfY29ubmVjdG9yLT5pMmMpCisJCURSTV9FUlJPUigi
ZmFpbGVkIHRvIGFkZCBkZGMgYnVzXG4iKTsKIAotCWRybV9jb25uZWN0b3JfaW5pdChkZXYsIGNv
bm5lY3RvciwKLQkJCSAgICZtZ2FfdmdhX2Nvbm5lY3Rvcl9mdW5jcywgRFJNX01PREVfQ09OTkVD
VE9SX1ZHQSk7CisJZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKGRldiwgY29ubmVjdG9yLAor
CQkJCSAgICAmbWdhX3ZnYV9jb25uZWN0b3JfZnVuY3MsCisJCQkJICAgIERSTV9NT0RFX0NPTk5F
Q1RPUl9WR0EsCisJCQkJICAgICZtZ2FfY29ubmVjdG9yLT5pMmMtPmFkYXB0ZXIpOwogCiAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwgJm1nYV92Z2FfY29ubmVjdG9yX2hlbHBl
cl9mdW5jcyk7CiAKIAlkcm1fY29ubmVjdG9yX3JlZ2lzdGVyKGNvbm5lY3Rvcik7CiAKLQltZ2Ff
Y29ubmVjdG9yLT5pMmMgPSBtZ2FnMjAwX2kyY19jcmVhdGUoZGV2KTsKLQlpZiAoIW1nYV9jb25u
ZWN0b3ItPmkyYykKLQkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gYWRkIGRkYyBidXNcbiIpOwotCiAJ
cmV0dXJuIGNvbm5lY3RvcjsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
