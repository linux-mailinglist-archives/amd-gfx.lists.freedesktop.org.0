Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CD5A0E0
	for <lists+amd-gfx@lfdr.de>; Fri, 28 Jun 2019 18:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C6F6E966;
	Fri, 28 Jun 2019 16:31:44 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4B16E95B;
 Fri, 28 Jun 2019 16:08:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: andrzej.p) with ESMTPSA id 3282E289CF7
From: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 21/22] drm/amdgpu: Provide ddc symlink in connector sysfs
 directory
Date: Fri, 28 Jun 2019 18:01:35 +0200
Message-Id: <5e355b8bec8fb3907566a741db8cc3e356246a32.1561735433.git.andrzej.p@collabora.com>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Liviu Dudau <liviu.dudau@arm.com>,
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
 Alexios Zavras <alexios.zavras@intel.com>,
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
Y29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYyAgICB8
IDcwICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNlcnRpb25zKCsp
LCAxOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfY29ubmVjdG9ycy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2Nvbm5lY3RvcnMuYwppbmRleCA3M2IyZWRlNzczZDMuLjVmOGE3ZTM4MThiOSAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Nvbm5lY3RvcnMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY29ubmVjdG9ycy5jCkBAIC0xNTczLDEx
ICsxNTczLDE1IEBAIGFtZGdwdV9jb25uZWN0b3JfYWRkKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LAogCQkJZ290byBmYWlsZWQ7CiAJCWFtZGdwdV9jb25uZWN0b3ItPmNvbl9wcml2ID0gYW1k
Z3B1X2RpZ19jb25uZWN0b3I7CiAJCWlmIChpMmNfYnVzLT52YWxpZCkgewotCQkJYW1kZ3B1X2Nv
bm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwotCQkJ
aWYgKGFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMpCisJCQlzdHJ1Y3QgYW1kZ3B1X2Nvbm5lY3Rv
ciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKKworCQkJYWNuLT5kZGNfYnVzID0gYW1kZ3B1X2ky
Y19sb29rdXAoYWRldiwgaTJjX2J1cyk7CisJCQlpZiAoYWNuLT5kZGNfYnVzKSB7CiAJCQkJaGFz
X2F1eCA9IHRydWU7Ci0JCQllbHNlCisJCQkJY29ubmVjdG9yLT5kZGMgPSAmYWNuLT5kZGNfYnVz
LT5hZGFwdGVyOworCQkJfSBlbHNlIHsKIAkJCQlEUk1fRVJST1IoIkRQOiBGYWlsZWQgdG8gYXNz
aWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJCQl9CiAJCX0K
IAkJc3dpdGNoIChjb25uZWN0b3JfdHlwZSkgewogCQljYXNlIERSTV9NT0RFX0NPTk5FQ1RPUl9W
R0E6CkBAIC0xNjYyLDkgKzE2NjYsMTMgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKmFkZXYsCiAJCQlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmYW1kZ3B1X2Nv
bm5lY3Rvci0+YmFzZSwgJmFtZGdwdV9jb25uZWN0b3JfdmdhX2Z1bmNzLCBjb25uZWN0b3JfdHlw
ZSk7CiAJCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2Us
ICZhbWRncHVfY29ubmVjdG9yX3ZnYV9oZWxwZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMtPnZh
bGlkKSB7Ci0JCQkJYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3Vw
KGFkZXYsIGkyY19idXMpOwotCQkJCWlmICghYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cykKKwkJ
CQlzdHJ1Y3QgYW1kZ3B1X2Nvbm5lY3RvciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKKworCQkJ
CWFjbi0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOworCQkJCWlm
ICghYWNuLT5kZGNfYnVzKQogCQkJCQlEUk1fRVJST1IoIlZHQTogRmFpbGVkIHRvIGFzc2lnbiBk
ZGMgYnVzISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOworCQkJCWVsc2UKKwkJCQkJ
Y29ubmVjdG9yLT5kZGMgPSAmYWNuLT5kZGNfYnVzLT5hZGFwdGVyOwogCQkJfQogCQkJYW1kZ3B1
X2Nvbm5lY3Rvci0+ZGFjX2xvYWRfZGV0ZWN0ID0gdHJ1ZTsKIAkJCWRybV9vYmplY3RfYXR0YWNo
X3Byb3BlcnR5KCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLmJhc2UsCkBAIC0xNjgyLDkgKzE2OTAs
MTMgQEAgYW1kZ3B1X2Nvbm5lY3Rvcl9hZGQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAJ
CQlkcm1fY29ubmVjdG9yX2luaXQoZGV2LCAmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdw
dV9jb25uZWN0b3JfdmdhX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7CiAJCQlkcm1fY29ubmVjdG9y
X2hlbHBlcl9hZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX3Zn
YV9oZWxwZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7Ci0JCQkJYW1kZ3B1X2Nv
bm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwotCQkJ
CWlmICghYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cykKKwkJCQlzdHJ1Y3QgYW1kZ3B1X2Nvbm5l
Y3RvciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKKworCQkJCWFjbi0+ZGRjX2J1cyA9IGFtZGdw
dV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOworCQkJCWlmICghYWNuLT5kZGNfYnVzKQogCQkJ
CQlEUk1fRVJST1IoIkRWSUE6IEZhaWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1lc2cg
Zm9yIGkyYyBlcnJvcnMuXG4iKTsKKwkJCQllbHNlCisJCQkJCWNvbm5lY3Rvci0+ZGRjID0gJmFj
bi0+ZGRjX2J1cy0+YWRhcHRlcjsKIAkJCX0KIAkJCWFtZGdwdV9jb25uZWN0b3ItPmRhY19sb2Fk
X2RldGVjdCA9IHRydWU7CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmYW1kZ3B1X2Nv
bm5lY3Rvci0+YmFzZS5iYXNlLApAQCAtMTcwNyw5ICsxNzE5LDEzIEBAIGFtZGdwdV9jb25uZWN0
b3JfYWRkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCQkJZHJtX2Nvbm5lY3Rvcl9pbml0
KGRldiwgJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX2R2aV9mdW5j
cywgY29ubmVjdG9yX3R5cGUpOwogCQkJZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZhbWRncHVf
Y29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9kdmlfaGVscGVyX2Z1bmNzKTsKIAkJ
CWlmIChpMmNfYnVzLT52YWxpZCkgewotCQkJCWFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMgPSBh
bWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKLQkJCQlpZiAoIWFtZGdwdV9jb25uZWN0
b3ItPmRkY19idXMpCisJCQkJc3RydWN0IGFtZGdwdV9jb25uZWN0b3IgKmFjbiA9IGFtZGdwdV9j
b25uZWN0b3I7CisKKwkJCQlhY24tPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBp
MmNfYnVzKTsKKwkJCQlpZiAoIWFjbi0+ZGRjX2J1cykKIAkJCQkJRFJNX0VSUk9SKCJEVkk6IEZh
aWxlZCB0byBhc3NpZ24gZGRjIGJ1cyEgQ2hlY2sgZG1lc2cgZm9yIGkyYyBlcnJvcnMuXG4iKTsK
KwkJCQllbHNlCisJCQkJCWNvbm5lY3Rvci0+ZGRjID0gJmFjbi0+ZGRjX2J1cy0+YWRhcHRlcjsK
IAkJCX0KIAkJCXN1YnBpeGVsX29yZGVyID0gU3ViUGl4ZWxIb3Jpem9udGFsUkdCOwogCQkJZHJt
X29iamVjdF9hdHRhY2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UuYmFzZSwKQEAg
LTE3NTcsOSArMTc3MywxMyBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiwKIAkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZhbWRncHVfY29ubmVjdG9y
LT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9kdmlfZnVuY3MsIGNvbm5lY3Rvcl90eXBlKTsKIAkJ
CWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwgJmFtZGdw
dV9jb25uZWN0b3JfZHZpX2hlbHBlcl9mdW5jcyk7CiAJCQlpZiAoaTJjX2J1cy0+dmFsaWQpIHsK
LQkJCQlhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzID0gYW1kZ3B1X2kyY19sb29rdXAoYWRldiwg
aTJjX2J1cyk7Ci0JCQkJaWYgKCFhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQorCQkJCXN0cnVj
dCBhbWRncHVfY29ubmVjdG9yICphY24gPSBhbWRncHVfY29ubmVjdG9yOworCisJCQkJYWNuLT5k
ZGNfYnVzID0gYW1kZ3B1X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7CisJCQkJaWYgKCFhY24t
PmRkY19idXMpCiAJCQkJCURSTV9FUlJPUigiSERNSTogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVz
ISBDaGVjayBkbWVzZyBmb3IgaTJjIGVycm9ycy5cbiIpOworCQkJCWVsc2UKKwkJCQkJY29ubmVj
dG9yLT5kZGMgPSAmYWNuLT5kZGNfYnVzLT5hZGFwdGVyOwogCQkJfQogCQkJZHJtX29iamVjdF9h
dHRhY2hfcHJvcGVydHkoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UuYmFzZSwKIAkJCQkJCSAgICAg
IGFkZXYtPm1vZGVfaW5mby5jb2hlcmVudF9tb2RlX3Byb3BlcnR5LApAQCAtMTc5OSwxMSArMTgx
OSwxNSBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwK
IAkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1k
Z3B1X2Nvbm5lY3Rvcl9kcF9mdW5jcywgY29ubmVjdG9yX3R5cGUpOwogCQkJZHJtX2Nvbm5lY3Rv
cl9oZWxwZXJfYWRkKCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9k
cF9oZWxwZXJfZnVuY3MpOwogCQkJaWYgKGkyY19idXMtPnZhbGlkKSB7Ci0JCQkJYW1kZ3B1X2Nv
bm5lY3Rvci0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOwotCQkJ
CWlmIChhbWRncHVfY29ubmVjdG9yLT5kZGNfYnVzKQorCQkJCXN0cnVjdCBhbWRncHVfY29ubmVj
dG9yICphY24gPSBhbWRncHVfY29ubmVjdG9yOworCisJCQkJYWNuLT5kZGNfYnVzID0gYW1kZ3B1
X2kyY19sb29rdXAoYWRldiwgaTJjX2J1cyk7CisJCQkJaWYgKGFjbi0+ZGRjX2J1cykgewogCQkJ
CQloYXNfYXV4ID0gdHJ1ZTsKLQkJCQllbHNlCisJCQkJCWNvbm5lY3Rvci0+ZGRjID0gJmFjbi0+
ZGRjX2J1cy0+YWRhcHRlcjsKKwkJCQl9IGVsc2UgewogCQkJCQlEUk1fRVJST1IoIkRQOiBGYWls
ZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMgZXJyb3JzLlxuIik7CisJ
CQkJfQogCQkJfQogCQkJc3VicGl4ZWxfb3JkZXIgPSBTdWJQaXhlbEhvcml6b250YWxSR0I7CiAJ
CQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZS5iYXNl
LApAQCAtMTg0MSwxMSArMTg2NSwxNSBAQCBhbWRncHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwKIAkJCWRybV9jb25uZWN0b3JfaW5pdChkZXYsICZhbWRncHVfY29u
bmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rvcl9lZHBfZnVuY3MsIGNvbm5lY3Rvcl90eXBl
KTsKIAkJCWRybV9jb25uZWN0b3JfaGVscGVyX2FkZCgmYW1kZ3B1X2Nvbm5lY3Rvci0+YmFzZSwg
JmFtZGdwdV9jb25uZWN0b3JfZHBfaGVscGVyX2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxp
ZCkgewotCQkJCWFtZGdwdV9jb25uZWN0b3ItPmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChh
ZGV2LCBpMmNfYnVzKTsKLQkJCQlpZiAoYW1kZ3B1X2Nvbm5lY3Rvci0+ZGRjX2J1cykKKwkJCQlz
dHJ1Y3QgYW1kZ3B1X2Nvbm5lY3RvciAqYWNuID0gYW1kZ3B1X2Nvbm5lY3RvcjsKKworCQkJCWFj
bi0+ZGRjX2J1cyA9IGFtZGdwdV9pMmNfbG9va3VwKGFkZXYsIGkyY19idXMpOworCQkJCWlmIChh
Y24tPmRkY19idXMpIHsKIAkJCQkJaGFzX2F1eCA9IHRydWU7Ci0JCQkJZWxzZQorCQkJCQljb25u
ZWN0b3ItPmRkYyA9ICZhY24tPmRkY19idXMtPmFkYXB0ZXI7CisJCQkJfSBlbHNlIHsKIAkJCQkJ
RFJNX0VSUk9SKCJEUDogRmFpbGVkIHRvIGFzc2lnbiBkZGMgYnVzISBDaGVjayBkbWVzZyBmb3Ig
aTJjIGVycm9ycy5cbiIpOworCQkJCX0KIAkJCX0KIAkJCWRybV9vYmplY3RfYXR0YWNoX3Byb3Bl
cnR5KCZhbWRncHVfY29ubmVjdG9yLT5iYXNlLmJhc2UsCiAJCQkJCQkgICAgICBkZXYtPm1vZGVf
Y29uZmlnLnNjYWxpbmdfbW9kZV9wcm9wZXJ0eSwKQEAgLTE4NjIsOSArMTg5MCwxMyBAQCBhbWRn
cHVfY29ubmVjdG9yX2FkZChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJCWRybV9jb25u
ZWN0b3JfaW5pdChkZXYsICZhbWRncHVfY29ubmVjdG9yLT5iYXNlLCAmYW1kZ3B1X2Nvbm5lY3Rv
cl9sdmRzX2Z1bmNzLCBjb25uZWN0b3JfdHlwZSk7CiAJCQlkcm1fY29ubmVjdG9yX2hlbHBlcl9h
ZGQoJmFtZGdwdV9jb25uZWN0b3ItPmJhc2UsICZhbWRncHVfY29ubmVjdG9yX2x2ZHNfaGVscGVy
X2Z1bmNzKTsKIAkJCWlmIChpMmNfYnVzLT52YWxpZCkgewotCQkJCWFtZGdwdV9jb25uZWN0b3It
PmRkY19idXMgPSBhbWRncHVfaTJjX2xvb2t1cChhZGV2LCBpMmNfYnVzKTsKLQkJCQlpZiAoIWFt
ZGdwdV9jb25uZWN0b3ItPmRkY19idXMpCisJCQkJc3RydWN0IGFtZGdwdV9jb25uZWN0b3IgKmFj
biA9IGFtZGdwdV9jb25uZWN0b3I7CisKKwkJCQlhY24tPmRkY19idXMgPSBhbWRncHVfaTJjX2xv
b2t1cChhZGV2LCBpMmNfYnVzKTsKKwkJCQlpZiAoIWFjbi0+ZGRjX2J1cykKIAkJCQkJRFJNX0VS
Uk9SKCJMVkRTOiBGYWlsZWQgdG8gYXNzaWduIGRkYyBidXMhIENoZWNrIGRtZXNnIGZvciBpMmMg
ZXJyb3JzLlxuIik7CisJCQkJZWxzZQorCQkJCQljb25uZWN0b3ItPmRkYyA9ICZhY24tPmRkY19i
dXMtPmFkYXB0ZXI7CiAJCQl9CiAJCQlkcm1fb2JqZWN0X2F0dGFjaF9wcm9wZXJ0eSgmYW1kZ3B1
X2Nvbm5lY3Rvci0+YmFzZS5iYXNlLAogCQkJCQkJICAgICAgZGV2LT5tb2RlX2NvbmZpZy5zY2Fs
aW5nX21vZGVfcHJvcGVydHksCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vYW1kLWdmeA==
