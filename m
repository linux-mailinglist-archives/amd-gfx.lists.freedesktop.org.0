Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B01F6555E
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:29:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFB666E1C4;
	Thu, 11 Jul 2019 11:29:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F3B6E1B5;
 Thu, 11 Jul 2019 11:29:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id AD88328B554
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 09/23] drm/imx: imx-ldb: Provide ddc symlink in connector's
 sysfs
Date: Thu, 11 Jul 2019 13:26:36 +0200
Message-Id: <9b61fe88ad7e1de60839a1484bb8a74c4e3d9710.1562843413.git.andrzej.p@collabora.com>
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
 linux-arm-kernel@lists.infradead.org, Enrico Weigelt <info@metux.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWxkYi5jIHwgMTMgKysrKysrLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyBiL2RyaXZlcnMvZ3B1L2RybS9p
bXgvaW14LWxkYi5jCmluZGV4IDM4MzczMzMwMjI4MC4uNDRmZGIyNjQzMzllIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14
L2lteC1sZGIuYwpAQCAtNTUsNyArNTUsNiBAQCBzdHJ1Y3QgaW14X2xkYl9jaGFubmVsIHsKIAlz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlOwogCiAJc3RydWN0IGRldmljZV9ub2RlICpjaGlsZDsK
LQlzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYzsKIAlpbnQgY2hubzsKIAl2b2lkICplZGlkOwogCWlu
dCBlZGlkX2xlbjsKQEAgLTEzMSw4ICsxMzAsOCBAQCBzdGF0aWMgaW50IGlteF9sZGJfY29ubmVj
dG9yX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCQkJcmV0dXJu
IG51bV9tb2RlczsKIAl9CiAKLQlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgaW14X2xkYl9jaC0+
ZGRjKQotCQlpbXhfbGRiX2NoLT5lZGlkID0gZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaW14X2xk
Yl9jaC0+ZGRjKTsKKwlpZiAoIWlteF9sZGJfY2gtPmVkaWQgJiYgY29ubmVjdG9yLT5kZGMpCisJ
CWlteF9sZGJfY2gtPmVkaWQgPSBkcm1fZ2V0X2VkaWQoY29ubmVjdG9yLCBjb25uZWN0b3ItPmRk
Yyk7CiAKIAlpZiAoaW14X2xkYl9jaC0+ZWRpZCkgewogCQlkcm1fY29ubmVjdG9yX3VwZGF0ZV9l
ZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwKQEAgLTU1MCwxNSArNTQ5LDE1IEBAIHN0YXRpYyBpbnQg
aW14X2xkYl9wYW5lbF9kZGMoc3RydWN0IGRldmljZSAqZGV2LAogCiAJZGRjX25vZGUgPSBvZl9w
YXJzZV9waGFuZGxlKGNoaWxkLCAiZGRjLWkyYy1idXMiLCAwKTsKIAlpZiAoZGRjX25vZGUpIHsK
LQkJY2hhbm5lbC0+ZGRjID0gb2ZfZmluZF9pMmNfYWRhcHRlcl9ieV9ub2RlKGRkY19ub2RlKTsK
KwkJY2hhbm5lbC0+Y29ubmVjdG9yLmRkYyA9IG9mX2ZpbmRfaTJjX2FkYXB0ZXJfYnlfbm9kZShk
ZGNfbm9kZSk7CiAJCW9mX25vZGVfcHV0KGRkY19ub2RlKTsKLQkJaWYgKCFjaGFubmVsLT5kZGMp
IHsKKwkJaWYgKCFjaGFubmVsLT5jb25uZWN0b3IuZGRjKSB7CiAJCQlkZXZfd2FybihkZXYsICJm
YWlsZWQgdG8gZ2V0IGRkYyBpMmMgYWRhcHRlclxuIik7CiAJCQlyZXR1cm4gLUVQUk9CRV9ERUZF
UjsKIAkJfQogCX0KIAotCWlmICghY2hhbm5lbC0+ZGRjKSB7CisJaWYgKCFjaGFubmVsLT5jb25u
ZWN0b3IuZGRjKSB7CiAJCS8qIGlmIG5vIEREQyBhdmFpbGFibGUsIGZhbGxiYWNrIHRvIGhhcmRj
b2RlZCBFRElEICovCiAJCWRldl9kYmcoZGV2LCAibm8gZGRjIGF2YWlsYWJsZVxuIik7CiAKQEAg
LTcyNSw3ICs3MjQsNyBAQCBzdGF0aWMgdm9pZCBpbXhfbGRiX3VuYmluZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZpY2UgKm1hc3RlciwKIAkJCWRybV9wYW5lbF9kZXRhY2goY2hhbm5l
bC0+cGFuZWwpOwogCiAJCWtmcmVlKGNoYW5uZWwtPmVkaWQpOwotCQlpMmNfcHV0X2FkYXB0ZXIo
Y2hhbm5lbC0+ZGRjKTsKKwkJaTJjX3B1dF9hZGFwdGVyKGNoYW5uZWwtPmNvbm5lY3Rvci5kZGMp
OwogCX0KIH0KIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
