Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C1F7A807
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 14:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45B0B89A44;
	Tue, 30 Jul 2019 12:18:05 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89B6E89A44
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 12:18:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id n9so40450888wrr.4
 for <amd-gfx@lists.freedesktop.org>; Tue, 30 Jul 2019 05:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SDN0UgHxo2bhj//2P/WJDFxFPTg/cR4k5aetAPrYMbg=;
 b=c7euMbNIQ2NvQ1JuBVTfKP2344E1V5K3aSXnodrhYnBNAhcmZJRr+ITP7sQRmQANf8
 oj/KraYVK4XE/X2v77ct1GuwaN+eV34spUmAY+CuBdkJYiLt7MRJXbmwsZ40z76/JPse
 8xJsT9Zp517nxlWMeYU/itFdfSFFHb5JBVmvUcDfd7QpHpzbK6C9Lha2E9uO9pg7xPEx
 c0zYbRwL9GxveRIDJprdgEz1rUT2NuudYBGEPIRcqVfaWAQNQ46HXLESjkEBYzfRSnV5
 S1g9XTzLrY587fwhZ8Pnek/y3KnkaqXWzM+OEjOWYE1JLXIUHrd5SEZx8vR0OAJe2XuA
 dAxg==
X-Gm-Message-State: APjAAAXyxg54nJY2OkQzpa++mIHisBwEwMnTyMAhQvNDfHBs4e/curD8
 rFVhpRSQazfkfMBrhFQjFnwZAQ==
X-Google-Smtp-Source: APXvYqwrZXHIdOjHqCaBtc/fxJ204upNIXdbZQ1XFcTuBMI9EYOOr5haFcmt0fyxegsJvYF8YPz9vQ==
X-Received: by 2002:a5d:6709:: with SMTP id o9mr72093948wru.301.1564489081848; 
 Tue, 30 Jul 2019 05:18:01 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 4sm146815432wro.78.2019.07.30.05.17.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 05:18:01 -0700 (PDT)
Subject: Re: [PATCH v4 19/23] drm/bridge: dw-hdmi: Provide ddc symlink in
 connector sysfs directory
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <cover.1562843413.git.andrzej.p@collabora.com>
 <ec88a18feffa37eceb947bb83a6f9f51fb575566.1562843413.git.andrzej.p@collabora.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <449b11e6-2386-4e5b-26f7-eb6046911f24@baylibre.com>
Date: Tue, 30 Jul 2019 14:17:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ec88a18feffa37eceb947bb83a6f9f51fb575566.1562843413.git.andrzej.p@collabora.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=SDN0UgHxo2bhj//2P/WJDFxFPTg/cR4k5aetAPrYMbg=;
 b=lpR4/auaXiiChSvAkpqNj3u0nfb0dI44Kf62aFsgF5YzASXaFRrXwAhUyTm2Kt8hbp
 zJhTMAAnbZryLHbdRuZfoncN6zqfZAO+YyNfxheYF1HQQtNHpTiY5qXyzJ+0kAQMDSWx
 o6+OatQQfntiw9g7AooovvzEEDvgRrUnMF2sxv97MCFvW8hHvFdeUp+4BhBOjy0TyAJL
 uk7WGKUdZswxzMnx3CqsJ+x+N3BEsKiykL9zKcJSc1VfjTcB+j/dYzVG+k6udmbWJrsl
 uf1pwtYgKlZPZ2DyxsG4lLEfBVpu1z34WxNd3YuSo79zEapzNPTGz5ZbzGmGuQV7XkB0
 DxwA==
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
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
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
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMTEvMDcvMjAxOSAxMzoyNiwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IFVzZSB0
aGUgZGRjIHBvaW50ZXIgcHJvdmlkZWQgYnkgdGhlIGdlbmVyaWMgY29ubmVjdG9yLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJ6ZWogUGlldHJhc2lld2ljeiA8YW5kcnplai5wQGNvbGxhYm9yYS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jIHwg
NDAgKysrKysrKysrKystLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlv
bnMoKyksIDIwIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3Bz
eXMvZHctaGRtaS5jCj4gaW5kZXggYzY0OTA5NDlkOWRiLi4wYjljOWYyNjE5ZGEgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWkuYwo+IEBAIC0xNjEsNyArMTYx
LDYgQEAgc3RydWN0IGR3X2hkbWkgewo+ICAKPiAgCXN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHBy
ZXZpb3VzX21vZGU7Cj4gIAo+IC0Jc3RydWN0IGkyY19hZGFwdGVyICpkZGM7Cj4gIAl2b2lkIF9f
aW9tZW0gKnJlZ3M7Cj4gIAlib29sIHNpbmtfaXNfaGRtaTsKPiAgCWJvb2wgc2lua19oYXNfYXVk
aW87Cj4gQEAgLTExMTgsNyArMTExNyw3IEBAIHN0YXRpYyBib29sIGR3X2hkbWlfc3VwcG9ydF9z
Y2RjKHN0cnVjdCBkd19oZG1pICpoZG1pKQo+ICAJCXJldHVybiBmYWxzZTsKPiAgCj4gIAkvKiBE
aXNhYmxlIGlmIG5vIEREQyBidXMgKi8KPiAtCWlmICghaGRtaS0+ZGRjKQo+ICsJaWYgKCFoZG1p
LT5jb25uZWN0b3IuZGRjKQo+ICAJCXJldHVybiBmYWxzZTsKPiAgCj4gIAkvKiBEaXNhYmxlIGlm
IFNDREMgaXMgbm90IHN1cHBvcnRlZCwgb3IgaWYgYW4gSEYtVlNEQiBibG9jayBpcyBhYnNlbnQg
Ki8KPiBAQCAtMTE1NiwxMCArMTE1NSwxMSBAQCB2b2lkIGR3X2hkbWlfc2V0X2hpZ2hfdG1kc19j
bG9ja19yYXRpbyhzdHJ1Y3QgZHdfaGRtaSAqaGRtaSkKPiAgCj4gIAkvKiBDb250cm9sIGZvciBU
TURTIEJpdCBQZXJpb2QvVE1EUyBDbG9jay1QZXJpb2QgUmF0aW8gKi8KPiAgCWlmIChkd19oZG1p
X3N1cHBvcnRfc2NkYyhoZG1pKSkgewo+ICsJCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjID0gaGRt
aS0+Y29ubmVjdG9yLmRkYzsKPiAgCQlpZiAobXRtZHNjbG9jayA+IEhETUkxNF9NQVhfVE1EU0NM
SykKPiAtCQkJZHJtX3NjZGNfc2V0X2hpZ2hfdG1kc19jbG9ja19yYXRpbyhoZG1pLT5kZGMsIDEp
Owo+ICsJCQlkcm1fc2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGRkYywgMSk7Cj4gIAkJ
ZWxzZQo+IC0JCQlkcm1fc2NkY19zZXRfaGlnaF90bWRzX2Nsb2NrX3JhdGlvKGhkbWktPmRkYywg
MCk7Cj4gKwkJCWRybV9zY2RjX3NldF9oaWdoX3RtZHNfY2xvY2tfcmF0aW8oZGRjLCAwKTsKPiAg
CX0KPiAgfQo+ICBFWFBPUlRfU1lNQk9MX0dQTChkd19oZG1pX3NldF9oaWdoX3RtZHNfY2xvY2tf
cmF0aW8pOwo+IEBAIC0xNzUwLDYgKzE3NTAsNyBAQCBzdGF0aWMgdm9pZCBoZG1pX2F2X2NvbXBv
c2VyKHN0cnVjdCBkd19oZG1pICpoZG1pLAo+ICAJaWYgKGR3X2hkbWlfc3VwcG9ydF9zY2RjKGhk
bWkpKSB7Cj4gIAkJaWYgKHZtb2RlLT5tdG1kc2Nsb2NrID4gSERNSTE0X01BWF9UTURTQ0xLIHx8
Cj4gIAkJICAgIGhkbWlfaW5mby0+c2NkYy5zY3JhbWJsaW5nLmxvd19yYXRlcykgewo+ICsJCQlz
dHJ1Y3QgaTJjX2FkYXB0ZXIgKmRkYyA9IGhkbWktPmNvbm5lY3Rvci5kZGM7Cj4gIAkJCS8qCj4g
IAkJCSAqIEhETUkyLjAgU3BlY2lmaWVzIHRoZSBmb2xsb3dpbmcgcHJvY2VkdXJlOgo+ICAJCQkg
KiBBZnRlciB0aGUgU291cmNlIERldmljZSBoYXMgZGV0ZXJtaW5lZCB0aGF0Cj4gQEAgLTE3NTks
MTMgKzE3NjAsMTIgQEAgc3RhdGljIHZvaWQgaGRtaV9hdl9jb21wb3NlcihzdHJ1Y3QgZHdfaGRt
aSAqaGRtaSwKPiAgCQkJICogU291cmNlIERldmljZXMgY29tcGxpYW50IHNoYWxsIHNldCB0aGUK
PiAgCQkJICogU291cmNlIFZlcnNpb24gPSAxLgo+ICAJCQkgKi8KPiAtCQkJZHJtX3NjZGNfcmVh
ZGIoaGRtaS0+ZGRjLCBTQ0RDX1NJTktfVkVSU0lPTiwKPiAtCQkJCSAgICAgICAmYnl0ZXMpOwo+
IC0JCQlkcm1fc2NkY193cml0ZWIoaGRtaS0+ZGRjLCBTQ0RDX1NPVVJDRV9WRVJTSU9OLAo+ICsJ
CQlkcm1fc2NkY19yZWFkYihkZGMsIFNDRENfU0lOS19WRVJTSU9OLCAmYnl0ZXMpOwo+ICsJCQlk
cm1fc2NkY193cml0ZWIoZGRjLCBTQ0RDX1NPVVJDRV9WRVJTSU9OLAo+ICAJCQkJbWluX3QodTgs
IGJ5dGVzLCBTQ0RDX01JTl9TT1VSQ0VfVkVSU0lPTikpOwo+ICAKPiAgCQkJLyogRW5hYmxlZCBT
Y3JhbWJsaW5nIGluIHRoZSBTaW5rICovCj4gLQkJCWRybV9zY2RjX3NldF9zY3JhbWJsaW5nKGhk
bWktPmRkYywgMSk7Cj4gKwkJCWRybV9zY2RjX3NldF9zY3JhbWJsaW5nKGhkbWktPmNvbm5lY3Rv
ci5kZGMsIDEpOwo+ICAKPiAgCQkJLyoKPiAgCQkJICogVG8gYWN0aXZhdGUgdGhlIHNjcmFtYmxl
ciBmZWF0dXJlLCB5b3UgbXVzdCBlbnN1cmUKPiBAQCAtMTc4MSw3ICsxNzgxLDcgQEAgc3RhdGlj
IHZvaWQgaGRtaV9hdl9jb21wb3NlcihzdHJ1Y3QgZHdfaGRtaSAqaGRtaSwKPiAgCQkJaGRtaV93
cml0ZWIoaGRtaSwgMCwgSERNSV9GQ19TQ1JBTUJMRVJfQ1RSTCk7Cj4gIAkJCWhkbWlfd3JpdGVi
KGhkbWksICh1OCl+SERNSV9NQ19TV1JTVFpfVE1EU1NXUlNUX1JFUSwKPiAgCQkJCSAgICBIRE1J
X01DX1NXUlNUWik7Cj4gLQkJCWRybV9zY2RjX3NldF9zY3JhbWJsaW5nKGhkbWktPmRkYywgMCk7
Cj4gKwkJCWRybV9zY2RjX3NldF9zY3JhbWJsaW5nKGhkbWktPmNvbm5lY3Rvci5kZGMsIDApOwo+
ICAJCX0KPiAgCX0KPiAgCj4gQEAgLTIxMjcsMTAgKzIxMjcsMTAgQEAgc3RhdGljIGludCBkd19o
ZG1pX2Nvbm5lY3Rvcl9nZXRfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikK
PiAgCXN0cnVjdCBlZGlkICplZGlkOwo+ICAJaW50IHJldCA9IDA7Cj4gIAo+IC0JaWYgKCFoZG1p
LT5kZGMpCj4gKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+
IC0JZWRpZCA9IGRybV9nZXRfZWRpZChjb25uZWN0b3IsIGhkbWktPmRkYyk7Cj4gKwllZGlkID0g
ZHJtX2dldF9lZGlkKGNvbm5lY3RvciwgaGRtaS0+Y29ubmVjdG9yLmRkYyk7Cj4gIAlpZiAoZWRp
ZCkgewo+ICAJCWRldl9kYmcoaGRtaS0+ZGV2LCAiZ290IGVkaWQ6IHdpZHRoWyVkXSB4IGhlaWdo
dFslZF1cbiIsCj4gIAkJCWVkaWQtPndpZHRoX2NtLCBlZGlkLT5oZWlnaHRfY20pOwo+IEBAIC0y
NTQ4LDkgKzI1NDgsOSBAQCBfX2R3X2hkbWlfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldiwKPiAgCj4gIAlkZGNfbm9kZSA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJkZGMtaTJjLWJ1
cyIsIDApOwo+ICAJaWYgKGRkY19ub2RlKSB7Cj4gLQkJaGRtaS0+ZGRjID0gb2ZfZ2V0X2kyY19h
ZGFwdGVyX2J5X25vZGUoZGRjX25vZGUpOwo+ICsJCWhkbWktPmNvbm5lY3Rvci5kZGMgPSBvZl9n
ZXRfaTJjX2FkYXB0ZXJfYnlfbm9kZShkZGNfbm9kZSk7Cj4gIAkJb2Zfbm9kZV9wdXQoZGRjX25v
ZGUpOwo+IC0JCWlmICghaGRtaS0+ZGRjKSB7Cj4gKwkJaWYgKCFoZG1pLT5jb25uZWN0b3IuZGRj
KSB7Cj4gIAkJCWRldl9kYmcoaGRtaS0+ZGV2LCAiZmFpbGVkIHRvIHJlYWQgZGRjIG5vZGVcbiIp
Owo+ICAJCQlyZXR1cm4gRVJSX1BUUigtRVBST0JFX0RFRkVSKTsKPiAgCQl9Cj4gQEAgLTI2ODks
NyArMjY4OSw3IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+ICAJaGRtaV9pbml0X2Nsa19yZWdlbmVyYXRvcihoZG1pKTsKPiAgCj4gIAkvKiBJZiBEREMg
YnVzIGlzIG5vdCBzcGVjaWZpZWQsIHRyeSB0byByZWdpc3RlciBIRE1JIEkyQyBidXMgKi8KPiAt
CWlmICghaGRtaS0+ZGRjKSB7Cj4gKwlpZiAoIWhkbWktPmNvbm5lY3Rvci5kZGMpIHsKPiAgCQkv
KiBMb29rIGZvciAob3B0aW9uYWwpIHN0dWZmIHJlbGF0ZWQgdG8gdW53ZWRnaW5nICovCj4gIAkJ
aGRtaS0+cGluY3RybCA9IGRldm1fcGluY3RybF9nZXQoZGV2KTsKPiAgCQlpZiAoIUlTX0VSUiho
ZG1pLT5waW5jdHJsKSkgewo+IEBAIC0yNzA4LDkgKzI3MDgsOSBAQCBfX2R3X2hkbWlfcHJvYmUo
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwKPiAgCQkJfQo+ICAJCX0KPiAgCj4gLQkJaGRt
aS0+ZGRjID0gZHdfaGRtaV9pMmNfYWRhcHRlcihoZG1pKTsKPiAtCQlpZiAoSVNfRVJSKGhkbWkt
PmRkYykpCj4gLQkJCWhkbWktPmRkYyA9IE5VTEw7Cj4gKwkJaGRtaS0+Y29ubmVjdG9yLmRkYyA9
IGR3X2hkbWlfaTJjX2FkYXB0ZXIoaGRtaSk7Cj4gKwkJaWYgKElTX0VSUihoZG1pLT5jb25uZWN0
b3IuZGRjKSkKPiArCQkJaGRtaS0+Y29ubmVjdG9yLmRkYyA9IE5VTEw7Cj4gIAl9Cj4gIAo+ICAJ
aGRtaS0+YnJpZGdlLmRyaXZlcl9wcml2YXRlID0gaGRtaTsKPiBAQCAtMjc3Niw3ICsyNzc2LDcg
QEAgX19kd19oZG1pX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCj4gIGVycl9p
YWhiOgo+ICAJaWYgKGhkbWktPmkyYykgewo+ICAJCWkyY19kZWxfYWRhcHRlcigmaGRtaS0+aTJj
LT5hZGFwKTsKPiAtCQloZG1pLT5kZGMgPSBOVUxMOwo+ICsJCWhkbWktPmNvbm5lY3Rvci5kZGMg
PSBOVUxMOwo+ICAJfQo+ICAKPiAgCWlmIChoZG1pLT5jZWNfbm90aWZpZXIpCj4gQEAgLTI3ODgs
NyArMjc4OCw3IEBAIF9fZHdfaGRtaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
LAo+ICBlcnJfaXNmcjoKPiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShoZG1pLT5pc2ZyX2Nsayk7
Cj4gIGVycl9yZXM6Cj4gLQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+ZGRjKTsKPiArCWkyY19wdXRf
YWRhcHRlcihoZG1pLT5jb25uZWN0b3IuZGRjKTsKPiAgCj4gIAlyZXR1cm4gRVJSX1BUUihyZXQp
Owo+ICB9Cj4gQEAgLTI4MTQsNyArMjgxNCw3IEBAIHN0YXRpYyB2b2lkIF9fZHdfaGRtaV9yZW1v
dmUoc3RydWN0IGR3X2hkbWkgKmhkbWkpCj4gIAlpZiAoaGRtaS0+aTJjKQo+ICAJCWkyY19kZWxf
YWRhcHRlcigmaGRtaS0+aTJjLT5hZGFwKTsKPiAgCWVsc2UKPiAtCQlpMmNfcHV0X2FkYXB0ZXIo
aGRtaS0+ZGRjKTsKPiArCQlpMmNfcHV0X2FkYXB0ZXIoaGRtaS0+Y29ubmVjdG9yLmRkYyk7Cj4g
IH0KPiAgCj4gIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gCgpSZXZpZXdlZC1ieTogTmVpbCBB
cm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
