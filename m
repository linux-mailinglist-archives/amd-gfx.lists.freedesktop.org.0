Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7084C655B4
	for <lists+amd-gfx@lfdr.de>; Thu, 11 Jul 2019 13:32:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F206E20D;
	Thu, 11 Jul 2019 11:32:10 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC246E17E;
 Thu, 11 Jul 2019 11:32:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id B376628B690
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 22/23] drm/radeon: Provide ddc symlink in connector sysfs
 directory
Date: Thu, 11 Jul 2019 13:26:49 +0200
Message-Id: <1dc6c9e758c20ece6d6809f61362a090051a0df7.1562843413.git.andrzej.p@collabora.com>
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
 Dave Airlie <airlied@redhat.com>, Harry Wentland <harry.wentland@amd.com>,
 intel-gfx@lists.freedesktop.org, Shashank Sharma <shashank.sharma@intel.com>,
 freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jyri Sarha <jsarha@ti.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Wilson <chris@chris-wilson.co.uk>,
 Sean Paul <sean@poorly.run>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, amd-gfx@lists.freedesktop.org,
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
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYyB8IDgw
ICsrKysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1MiBpbnNlcnRpb25zKCsp
LCAyOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9jb25uZWN0b3JzLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0
b3JzLmMKaW5kZXggYzYwZDFhNDRkMjJhLi5lZTc0MzBkMDUxNmUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Nvbm5lY3RvcnMuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9jb25uZWN0b3JzLmMKQEAgLTE5NDcsMTAgKzE5NDcsMTIgQEAgcmFk
ZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyYWRlb25f
Y29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9yOwogCQlpZiAoaTJjX2J1
cy0+dmFsaWQpIHsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xv
b2t1cChyZGV2LCBpMmNfYnVzKTsKLQkJCWlmIChyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQor
CQkJaWYgKHJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpIHsKIAkJCQloYXNfYXV4ID0gdHJ1ZTsK
LQkJCWVsc2UKKwkJCQljb25uZWN0b3ItPmRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVz
LT5hZGFwdGVyOworCQkJfSBlbHNlIHsKIAkJCQlEUk1fRVJST1IoIkRQOiBGYWlsZWQgdG8gYXNz
aWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQl9CiAJCX0K
IAkJc3dpdGNoIChjb25uZWN0b3JfdHlwZSkgewogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9W
R0E6CkBAIC0yMDQyLDEzICsyMDQ0LDE1IEBAIHJhZGVvbl9hZGRfYXRvbV9jb25uZWN0b3Ioc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAl9IGVsc2UgewogCQlzd2l0Y2ggKGNvbm5lY3Rvcl90eXBl
KSB7CiAJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX1ZHQToKLQkJCWRybV9jb25uZWN0b3JfaW5p
dChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfZnVu
Y3MsIGNvbm5lY3Rvcl90eXBlKTsKLQkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9u
X2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJ
CQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCQlyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0g
cmFkZW9uX2kyY19sb29rdXAocmRldiwgaTJjX2J1cyk7CiAJCQkJaWYgKCFyYWRlb25fY29ubmVj
dG9yLT5kZGNfYnVzKQogCQkJCQlEUk1fRVJST1IoIlZHQTogRmFpbGVkIHRvIGFzc2lnbiBkZGMg
YnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOworCQkJCWVsc2UKKwkJCQkJY29u
bmVjdG9yLT5kZGMgPSAmcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0K
KwkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX3ZnYV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKKwkJCWRybV9jb25uZWN0
b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVj
dG9yX2hlbHBlcl9mdW5jcyk7CiAJCQlyYWRlb25fY29ubmVjdG9yLT5kYWNfbG9hZF9kZXRlY3Qg
PSB0cnVlOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3It
PmJhc2UuYmFzZSwKIAkJCQkJCSAgICAgIHJkZXYtPm1vZGVfaW5mby5sb2FkX2RldGVjdF9wcm9w
ZXJ0eSwKQEAgLTIwNjcsMTMgKzIwNzEsMTUgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3Rvcihz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJY29ubmVjdG9yLT5kb3VibGVzY2FuX2FsbG93ZWQg
PSB0cnVlOwogCQkJYnJlYWs7CiAJCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RWSUE6Ci0JCQlk
cm1fY29ubmVjdG9yX2luaXQoZGV2LCAmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92
Z2FfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7Ci0JCQlkcm1fY29ubmVjdG9yX2hl
bHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9o
ZWxwZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5l
Y3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwogCQkJCWlm
ICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQkJRFJNX0VSUk9SKCJEVklBOiBGYWls
ZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJ
CQkJZWxzZQorCQkJCQljb25uZWN0b3ItPmRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVz
LT5hZGFwdGVyOwogCQkJfQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25u
ZWN0b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUp
OworCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAm
cmFkZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCXJhZGVvbl9jb25uZWN0b3It
PmRhY19sb2FkX2RldGVjdCA9IHRydWU7CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgm
cmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkJICAgICAgcmRldi0+bW9kZV9pbmZv
LmxvYWRfZGV0ZWN0X3Byb3BlcnR5LApAQCAtMjA5OCwxMyArMjEwNCwxNSBAQCByYWRlb25fYWRk
X2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZ290byBmYWlsZWQ7
CiAJCQlyYWRlb25fZGlnX2Nvbm5lY3Rvci0+aWdwX2xhbmVfaW5mbyA9IGlncF9sYW5lX2luZm87
CiAJCQlyYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9yOwot
CQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRl
b25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQkJZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2R2aV9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxpZCkgewogCQkJCXJhZGVvbl9j
b25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKIAkJ
CQlpZiAoIXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCiAJCQkJCURSTV9FUlJPUigiRFZJOiBG
YWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7
CisJCQkJZWxzZQorCQkJCQljb25uZWN0b3ItPmRkYyA9ICZyYWRlb25fY29ubmVjdG9yLT5kZGNf
YnVzLT5hZGFwdGVyOwogCQkJfQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5
cGUpOworCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNl
LCAmcmFkZW9uX2R2aV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCXN1YnBpeGVsX29yZGVy
ID0gU3ViUGl4ZWxIb3Jpem9udGFsUkdCOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHko
JnJhZGVvbl9jb25uZWN0b3ItPmJhc2UuYmFzZSwKIAkJCQkJCSAgICAgIHJkZXYtPm1vZGVfaW5m
by5jb2hlcmVudF9tb2RlX3Byb3BlcnR5LApAQCAtMjE1NSwxMyArMjE2MywxNSBAQCByYWRlb25f
YWRkX2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJZ290byBmYWls
ZWQ7CiAJCQlyYWRlb25fZGlnX2Nvbm5lY3Rvci0+aWdwX2xhbmVfaW5mbyA9IGlncF9sYW5lX2lu
Zm87CiAJCQlyYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdiA9IHJhZGVvbl9kaWdfY29ubmVjdG9y
OwotCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZy
YWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQkJZHJtX2Nvbm5l
Y3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2R2aV9jb25u
ZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxpZCkgewogCQkJCXJhZGVv
bl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsK
IAkJCQlpZiAoIXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCiAJCQkJCURSTV9FUlJPUigiSERN
STogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5c
biIpOworCQkJCWVsc2UKKwkJCQkJY29ubmVjdG9yLT5kZGMgPSAmcmFkZW9uX2Nvbm5lY3Rvci0+
ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0KKwkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRl
b25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2R2aV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rv
cl90eXBlKTsKKwkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+
YmFzZSwgJnJhZGVvbl9kdmlfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCQlkcm1fb2JqZWN0
X2F0dGFjaF9wcm9wZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkJICAg
ICAgcmRldi0+bW9kZV9pbmZvLmNvaGVyZW50X21vZGVfcHJvcGVydHksCiAJCQkJCQkgICAgICAx
KTsKQEAgLTIyMDUsMTUgKzIyMTUsMTcgQEAgcmFkZW9uX2FkZF9hdG9tX2Nvbm5lY3RvcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCWdvdG8gZmFpbGVkOwogCQkJcmFkZW9uX2RpZ19jb25u
ZWN0b3ItPmlncF9sYW5lX2luZm8gPSBpZ3BfbGFuZV9pbmZvOwogCQkJcmFkZW9uX2Nvbm5lY3Rv
ci0+Y29uX3ByaXYgPSByYWRlb25fZGlnX2Nvbm5lY3RvcjsKLQkJCWRybV9jb25uZWN0b3JfaW5p
dChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2RwX2Nvbm5lY3Rvcl9mdW5j
cywgY29ubmVjdG9yX3R5cGUpOwotCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25f
Y29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2RwX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJ
aWYgKGkyY19idXMtPnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJh
ZGVvbl9pMmNfbG9va3VwKHJkZXYsIGkyY19idXMpOwotCQkJCWlmIChyYWRlb25fY29ubmVjdG9y
LT5kZGNfYnVzKQorCQkJCWlmIChyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKSB7CiAJCQkJCWhh
c19hdXggPSB0cnVlOwotCQkJCWVsc2UKKwkJCQkJY29ubmVjdG9yLT5kZGMgPSAmcmFkZW9uX2Nv
bm5lY3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKKwkJCQl9IGVsc2UgewogCQkJCQlEUk1fRVJST1Io
IkRQOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3Jz
LlxuIik7CisJCQkJfQogCQkJfQorCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHBfY29ubmVjdG9yX2Z1bmNzLCBjb25uZWN0b3JfdHlw
ZSk7CisJCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2Us
ICZyYWRlb25fZHBfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCQlzdWJwaXhlbF9vcmRlciA9
IFN1YlBpeGVsSG9yaXpvbnRhbFJHQjsKIAkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZy
YWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJCQkgICAgICByZGV2LT5tb2RlX2luZm8u
Y29oZXJlbnRfbW9kZV9wcm9wZXJ0eSwKQEAgLTIyNTUsMTUgKzIyNjcsMTcgQEAgcmFkZW9uX2Fk
ZF9hdG9tX2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQkJCWdvdG8gZmFpbGVk
OwogCQkJcmFkZW9uX2RpZ19jb25uZWN0b3ItPmlncF9sYW5lX2luZm8gPSBpZ3BfbGFuZV9pbmZv
OwogCQkJcmFkZW9uX2Nvbm5lY3Rvci0+Y29uX3ByaXYgPSByYWRlb25fZGlnX2Nvbm5lY3RvcjsK
LQkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX2VkcF9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKLQkJCWRybV9jb25uZWN0
b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9kcF9jb25uZWN0
b3JfaGVscGVyX2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxpZCkgewogCQkJCXJhZGVvbl9j
b25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVzKTsKLQkJ
CQlpZiAocmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKKwkJCQlpZiAocmFkZW9uX2Nvbm5lY3Rv
ci0+ZGRjX2J1cykgewogCQkJCQloYXNfYXV4ID0gdHJ1ZTsKLQkJCQllbHNlCisJCQkJCWNvbm5l
Y3Rvci0+ZGRjID0gJnJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7CisJCQkJfSBl
bHNlIHsKIAkJCQkJRFJNX0VSUk9SKCJEUDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVj
ayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOworCQkJCX0KIAkJCX0KKwkJCWRybV9jb25uZWN0
b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFkZW9uX2VkcF9jb25uZWN0
b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKKwkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgm
cmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9kcF9jb25uZWN0b3JfaGVscGVyX2Z1bmNz
KTsKIAkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNl
LmJhc2UsCiAJCQkJCQkgICAgICBkZXYtPm1vZGVfY29uZmlnLnNjYWxpbmdfbW9kZV9wcm9wZXJ0
eSwKIAkJCQkJCSAgICAgIERSTV9NT0RFX1NDQUxFX0ZVTExTQ1JFRU4pOwpAQCAtMjI5NCwxMyAr
MjMwOCwxNSBAQCByYWRlb25fYWRkX2F0b21fY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsCiAJCQkJZ290byBmYWlsZWQ7CiAJCQlyYWRlb25fZGlnX2Nvbm5lY3Rvci0+aWdwX2xhbmVf
aW5mbyA9IGlncF9sYW5lX2luZm87CiAJCQlyYWRlb25fY29ubmVjdG9yLT5jb25fcHJpdiA9IHJh
ZGVvbl9kaWdfY29ubmVjdG9yOwotCQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90
eXBlKTsKLQkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFz
ZSwgJnJhZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMt
PnZhbGlkKSB7CiAJCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9v
a3VwKHJkZXYsIGkyY19idXMpOwogCQkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykK
IAkJCQkJRFJNX0VSUk9SKCJMVkRTOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRt
ZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQkJZWxzZQorCQkJCQljb25uZWN0b3ItPmRkYyA9
ICZyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzLT5hZGFwdGVyOwogCQkJfQorCQkJZHJtX2Nvbm5l
Y3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25u
ZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKKwkJCWRybV9jb25uZWN0b3JfaGVscGVyX2Fk
ZCgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl9sdmRzX2Nvbm5lY3Rvcl9oZWxwZXJf
ZnVuY3MpOwogCQkJZHJtX29iamVjdF9hdHRhY2hfcHJvcGVydHkoJnJhZGVvbl9jb25uZWN0b3It
PmJhc2UuYmFzZSwKIAkJCQkJCSAgICAgIGRldi0+bW9kZV9jb25maWcuc2NhbGluZ19tb2RlX3By
b3BlcnR5LAogCQkJCQkJICAgICAgRFJNX01PREVfU0NBTEVfRlVMTFNDUkVFTik7CkBAIC0yMzc4
LDEzICsyMzk0LDE1IEBAIHJhZGVvbl9hZGRfbGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCiAJc3dpdGNoIChjb25uZWN0b3JfdHlwZSkgewogCWNhc2UgRFJNX01PREVf
Q09OTkVDVE9SX1ZHQToKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwot
CQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRl
b25fdmdhX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsK
IAkJCXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBp
MmNfYnVzKTsKIAkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQlEUk1fRVJS
T1IoIlZHQTogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVy
cm9ycy5cbiIpOworCQkJZWxzZQorCQkJCWNvbm5lY3Rvci0+ZGRjID0gJnJhZGVvbl9jb25uZWN0
b3ItPmRkY19idXMtPmFkYXB0ZXI7CiAJCX0KKwkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJh
ZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVj
dG9yX3R5cGUpOworCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3It
PmJhc2UsICZyYWRlb25fdmdhX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlyYWRlb25fY29u
bmVjdG9yLT5kYWNfbG9hZF9kZXRlY3QgPSB0cnVlOwogCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9w
ZXJ0eSgmcmFkZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkgICAgICByZGV2LT5tb2Rl
X2luZm8ubG9hZF9kZXRlY3RfcHJvcGVydHksCkBAIC0yMzk1LDEzICsyNDEzLDE1IEBAIHJhZGVv
bl9hZGRfbGVnYWN5X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQljb25uZWN0
b3ItPmRvdWJsZXNjYW5fYWxsb3dlZCA9IHRydWU7CiAJCWJyZWFrOwogCWNhc2UgRFJNX01PREVf
Q09OTkVDVE9SX0RWSUE6Ci0JCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZyYWRlb25fY29ubmVj
dG9yLT5iYXNlLCAmcmFkZW9uX3ZnYV9jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsK
LQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX3ZnYV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsKIAkJaWYgKGkyY19idXMtPnZhbGlkKSB7
CiAJCQlyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzID0gcmFkZW9uX2kyY19sb29rdXAocmRldiwg
aTJjX2J1cyk7CiAJCQlpZiAoIXJhZGVvbl9jb25uZWN0b3ItPmRkY19idXMpCiAJCQkJRFJNX0VS
Uk9SKCJEVklBOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMg
ZXJyb3JzLlxuIik7CisJCQllbHNlCisJCQkJY29ubmVjdG9yLT5kZGMgPSAmcmFkZW9uX2Nvbm5l
Y3Rvci0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJfQorCQlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAm
cmFkZW9uX2Nvbm5lY3Rvci0+YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2Z1bmNzLCBjb25u
ZWN0b3JfdHlwZSk7CisJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmcmFkZW9uX2Nvbm5lY3Rv
ci0+YmFzZSwgJnJhZGVvbl92Z2FfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCXJhZGVvbl9j
b25uZWN0b3ItPmRhY19sb2FkX2RldGVjdCA9IHRydWU7CiAJCWRybV9vYmplY3RfYXR0YWNoX3By
b3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJCSAgICAgIHJkZXYtPm1v
ZGVfaW5mby5sb2FkX2RldGVjdF9wcm9wZXJ0eSwKQEAgLTI0MTMsMTMgKzI0MzMsMTUgQEAgcmFk
ZW9uX2FkZF9sZWdhY3lfY29ubmVjdG9yKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCWJyZWFr
OwogCWNhc2UgRFJNX01PREVfQ09OTkVDVE9SX0RWSUk6CiAJY2FzZSBEUk1fTU9ERV9DT05ORUNU
T1JfRFZJRDoKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0b3ItPmJh
c2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwotCQlkcm1f
Y29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZp
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsKIAkJCXJh
ZGVvbl9jb25uZWN0b3ItPmRkY19idXMgPSByYWRlb25faTJjX2xvb2t1cChyZGV2LCBpMmNfYnVz
KTsKIAkJCWlmICghcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cykKIAkJCQlEUk1fRVJST1IoIkRW
STogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5c
biIpOworCQkJZWxzZQorCQkJCWNvbm5lY3Rvci0+ZGRjID0gJnJhZGVvbl9jb25uZWN0b3ItPmRk
Y19idXMtPmFkYXB0ZXI7CiAJCX0KKwkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9j
b25uZWN0b3ItPmJhc2UsICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9mdW5jcywgY29ubmVjdG9yX3R5
cGUpOworCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJnJhZGVvbl9jb25uZWN0b3ItPmJhc2Us
ICZyYWRlb25fZHZpX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MpOwogCQlpZiAoY29ubmVjdG9yX3R5
cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0RWSUkpIHsKIAkJCXJhZGVvbl9jb25uZWN0b3ItPmRh
Y19sb2FkX2RldGVjdCA9IHRydWU7CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmcmFk
ZW9uX2Nvbm5lY3Rvci0+YmFzZS5iYXNlLApAQCAtMjQ1OCwxMyArMjQ4MCwxNSBAQCByYWRlb25f
YWRkX2xlZ2FjeV9jb25uZWN0b3Ioc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAkJY29ubmVjdG9y
LT5kb3VibGVzY2FuX2FsbG93ZWQgPSBmYWxzZTsKIAkJYnJlYWs7CiAJY2FzZSBEUk1fTU9ERV9D
T05ORUNUT1JfTFZEUzoKLQkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgJnJhZGVvbl9jb25uZWN0
b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3JfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsK
LQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLCAmcmFk
ZW9uX2x2ZHNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCWlmIChpMmNfYnVzLT52YWxpZCkg
ewogCQkJcmFkZW9uX2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IHJhZGVvbl9pMmNfbG9va3VwKHJkZXYs
IGkyY19idXMpOwogCQkJaWYgKCFyYWRlb25fY29ubmVjdG9yLT5kZGNfYnVzKQogCQkJCURSTV9F
UlJPUigiTFZEUzogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJj
IGVycm9ycy5cbiIpOworCQkJZWxzZQorCQkJCWNvbm5lY3Rvci0+ZGRjID0gJnJhZGVvbl9jb25u
ZWN0b3ItPmRkY19idXMtPmFkYXB0ZXI7CiAJCX0KKwkJZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwg
JnJhZGVvbl9jb25uZWN0b3ItPmJhc2UsICZyYWRlb25fbHZkc19jb25uZWN0b3JfZnVuY3MsIGNv
bm5lY3Rvcl90eXBlKTsKKwkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZyYWRlb25fY29ubmVj
dG9yLT5iYXNlLCAmcmFkZW9uX2x2ZHNfY29ubmVjdG9yX2hlbHBlcl9mdW5jcyk7CiAJCWRybV9v
YmplY3RfYXR0YWNoX3Byb3BlcnR5KCZyYWRlb25fY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJ
CSAgICAgIGRldi0+bW9kZV9jb25maWcuc2NhbGluZ19tb2RlX3Byb3BlcnR5LAogCQkJCQkgICAg
ICBEUk1fTU9ERV9TQ0FMRV9GVUxMU0NSRUVOKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
