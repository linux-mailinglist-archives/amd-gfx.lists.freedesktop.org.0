Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D667ABD3
	for <lists+amd-gfx@lfdr.de>; Tue, 30 Jul 2019 17:02:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2D6E592;
	Tue, 30 Jul 2019 15:01:57 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E066B6E46F;
 Tue, 30 Jul 2019 15:01:55 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x4so12990799wrt.6;
 Tue, 30 Jul 2019 08:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BUCxY5wmqR5ryTNjhNIWHdJ7i3gNBOvH+JRjNUJQGa8=;
 b=YIbd7BIcaddo5KccVBXLgHQUYocATrdouiJzNTpFNvj02Bk98Py0p3opbSmgDYTQHD
 Lk0erY7YBktrnai/EQwlDjw79WSG6pOhMz1ASjrx8KIhs7IbjSq7GW+EZfO1vLDOqmnL
 fTORA0cqKThi829hbS01i0FUGPaxl8czSpIQf08QVtxwwY5U1rLGeJBagdps0kGydeXD
 ISiaWUuUyOSY3TpojQogk7ZfuZCBwvHCELLPAdelYabdicypptyT0rbX0Ii+Nl/rRy9f
 VNogQI2iFRCqC6McCim4bOc0Wrbm6NPf29o4jTwOsIYG65+UTCKq9GYCMqf+p/wq/hoj
 itfA==
X-Gm-Message-State: APjAAAXirLOjIZSDFeLH1L/PuKySNSYw1FdpE8kY4qiYKJNICs/yj+E4
 ElzvDpxdGwaT8DYV7iTIWWw=
X-Google-Smtp-Source: APXvYqwdniRq6FlC94y6eD3mcoVNrtnUuOW1twW9ouGkHusLsB9ou6xcWqTT8SZS9DAhF1a4uzxINQ==
X-Received: by 2002:adf:f1d1:: with SMTP id z17mr57714333wro.190.1564498914397; 
 Tue, 30 Jul 2019 08:01:54 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id b2sm83558508wrp.72.2019.07.30.08.01.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 08:01:53 -0700 (PDT)
Date: Tue, 30 Jul 2019 16:01:23 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCH v6 00/24] Associate ddc adapters with connectors
Message-ID: <20190730150123.GD12424@arch-x1c3>
References: <cover.1564161140.git.andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1564161140.git.andrzej.p@collabora.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BUCxY5wmqR5ryTNjhNIWHdJ7i3gNBOvH+JRjNUJQGa8=;
 b=SkH6XcqU/bxeDt2rOR4GX1fpuFQXcm+RQC863rXC9rGzpMxmOKEVFRlmOvAc7jLACg
 QOUFUrJPqcBPXG/WOLgpfqzhw3MLnUxHZUncDqumd/7Hyu++MKtZigS8Ivf2JJxbmBQH
 /lXuzAjfQTgG6IzIuwjrroXtmrntW89QjG68z2s5wVuefWfP2uzHYX9Q1YBLLcxDZ8LS
 x876suaiyxwRUTJTBLhsqQtn4iCAzbJgVbjcjveT3kXUKyrRhS9gBDD3vohc41Hye37u
 aOaDoO4SrLxmO73wRh2N9huGfdN4gACFPNXw9ugYN5wE+6PAxLUZOgw3BxkvO9xVj8C2
 +dMg==
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
Cc: Maxime Ripard <mripard@kernel.org>, "Y.C. Chen" <yc_chen@aspeedtech.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Ramalingam C <ramalingam.c@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, Andrzej Hajda <a.hajda@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com,
 Fabio Estevam <festevam@gmail.com>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Sandy Huang <hjc@rock-chips.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, CK Hu <ck.hu@mediatek.com>,
 Dave Airlie <airlied@redhat.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shashank Sharma <shashank.sharma@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jyri Sarha <jsarha@ti.com>, Inki Dae <inki.dae@samsung.com>,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-mediatek@lists.infradead.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Gleixner <tglx@linutronix.de>,
 Vincent Abriou <vincent.abriou@st.com>, linux-arm-kernel@lists.infradead.org,
 Sean Paul <sean@poorly.run>, Jernej Skrabec <jernej.skrabec@siol.net>,
 amd-gfx@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Eric Anholt <eric@anholt.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Todor Tomov <todor.tomov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, freedreno@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gMjAxOS8wNy8yNiwgQW5kcnplaiBQaWV0cmFzaWV3aWN6IHdyb3RlOgo+IEl0IGlzIGRpZmZp
Y3VsdCBmb3IgYSB1c2VyIHRvIGtub3cgd2hpY2ggb2YgdGhlIGkyYyBhZGFwdGVycyBpcyBmb3Ig
d2hpY2gKPiBkcm0gY29ubmVjdG9yLiBUaGlzIHNlcmllcyBhZGRyZXNzZXMgdGhpcyBwcm9ibGVt
Lgo+IAo+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBzeW1ib2xpYyBsaW5rIGluIGNvbm5lY3Rvcidz
IHN5c2ZzIGRpcmVjdG9yeSwgZS5nLjoKPiAKPiBscyAtbCAvc3lzL2NsYXNzL2RybS9jYXJkMC1I
RE1JLUEtMS9kZGMKPiBscnd4cnd4cnd4IDEgcm9vdCByb290IDAgSnVuIDI0IDEwOjQyIC9zeXMv
Y2xhc3MvZHJtL2NhcmQwLUhETUktQS0xL2RkYyBcCj4gCS0+IC4uLy4uLy4uLy4uL3NvYy8xMzg4
MDAwMC5pMmMvaTJjLTIKPiAKPiBUaGUgdXNlciB0aGVuIGtub3dzIHRoYXQgdGhlaXIgY2FyZDAt
SERNSS1BLTEgdXNlcyBpMmMtMiBhbmQgY2FuIGUuZy4gcnVuCj4gZGRjdXRpbDoKPiAKPiBkZGN1
dGlsIC1iIDIgZ2V0dmNwIDB4MTAKPiBWQ1AgY29kZSAweDEwIChCcmlnaHRuZXNzKTogY3VycmVu
dCB2YWx1ZSA9ICAgIDkwLCBtYXggdmFsdWUgPSAgIDEwMAo+IAo+IFRoZSBmaXJzdCBwYXRjaCBp
biB0aGUgc2VyaWVzIGFkZHMgc3RydWN0IGkyY19hZGFwdGVyIHBvaW50ZXIgdG8gc3RydWN0Cj4g
ZHJtX2Nvbm5lY3Rvci4gSWYgdGhlIGZpZWxkIGlzIHVzZWQgYnkgYSBwYXJ0aWN1bGFyIGRyaXZl
ciwgdGhlbiBhbgo+IGFwcHJvcHJpYXRlIHN5bWJvbGljIGxpbmsgaXMgY3JlYXRlZCBieSB0aGUg
Z2VuZXJpYyBjb2RlLCB3aGljaCBpcyBhbHNvIGFkZGVkCj4gYnkgdGhpcyBwYXRjaC4KPiAKPiBQ
YXRjaCAyIGFkZHMgYSBuZXcgdmFyaWFudCBvZiBkcm1fY29ubmVjdG9yX2luaXQoKSwgc2VlIHRo
ZSBjaGFuZ2Vsb2cKPiBiZWxvdy4KPiAKPiBQYXRjaGVzIDMuLjI0IGFyZSBleGFtcGxlcyBvZiBo
b3cgdG8gY29udmVydCBhIGRyaXZlciB0byB0aGlzIG5ldyBzY2hlbWUuCj4gCj4gdjEuLnYyOgo+
IAo+IC0gdXNlZCBmaXhlZCBuYW1lICJkZGMiIGZvciB0aGUgc3ltYm9saWMgbGluayBpbiBvcmRl
ciB0byBtYWtlIGl0IGVhc3kgZm9yCj4gdXNlcnNwYWNlIHRvIGZpbmQgdGhlIGkyYyBhZGFwdGVy
Cj4gCj4gdjIuLnYzOgo+IAo+IC0gY29udmVydGVkIGFzIG1hbnkgZHJpdmVycyBhcyBwb3NzaWJs
ZS4KPiAKPiB2My4udjQ6Cj4gCj4gLSBhZGRlZCBSZXZpZXdlZC1ieSBmb3IgcGF0Y2ggMDEvMjMK
PiAtIG1vdmVkICJkZGMiIGZpZWxkIGFzc2lnbm1lbnQgdG8gYmVmb3JlIGRybV9jb25uZWN0b3Jf
aW5pdCgpIGlzIGNhbGxlZAo+IGluIG1zbSwgdmM0LCBzdGksIG1nYWcyMDAsIGFzdCwgYW1kZ3B1
LCByYWRlb24KPiAtIHNpbXBsaWZpZWQgdGhlIGNvZGUgaW4gYW1kZ3B1IGFuZCByYWRlb24gYXQg
dGhlIGV4cGVuc2Ugb2Ygc29tZSBsaW5lcwo+IGV4Y2VlZGluZyA4MCBjaGFyYWN0ZXJzIGFzIHBl
ciBBbGV4IERldWNoZXIncyBzdWdnZXN0aW9uCj4gLSBhZGRlZCBpOTE1Cj4gCj4gdjQuLnY1Ogo+
IAo+IC0gY2hhbmdlZCAiaW5jbHVkZSA8bGludXgvaTJjLmg+IiB0byAic3RydWN0IGkyY19hZGFw
dGVyOyIKPiBpbiBkcm1fY29ubmVjdG9yLmgsIGNvbnNlcXVlbnRseSwgYWRkZWQgImluY2x1ZGUg
PGxpbnV4L2kyYy5oPiIKPiBpbiBkcm1fc3lzZnMuYy4KPiAtIGFkZGVkICJkcm1fY29ubmVjdG9y
X2luaXRfd2l0aF9kZGMoKSIgdmFyaWFudCB0byBlbnN1cmUgdGhhdCB0aGUgZGRjCj4gZmllbGQg
b2YgZHJtX2Nvbm5lY3RvciBpcyBwcmVzZXJ2ZWQgYWNjcm9zcyBpdHMgaW52b2NhdGlvbgo+IC0g
YWNjb3JkaW5nbHkgY2hhbmdlZCBpbnZvY2F0aW9ucyBvZiBkcm1fY29ubmVjdG9yX2luaXQoKSBp
biB0aGUKPiB0b3VjaGVkIGRyaXZlcnMgdG8gdXNlIHRoZSBuZXcgdmFyaWFudAo+IAo+IHY1Li52
NjoKPiAKPiAtIGltcHJvdmVkIHN1YmplY3QgbGluZSBvZiBwYXRjaCAxCj4gLSBhZGRlZCBrZXJu
ZWwtZG9jIGZvciBkcm1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMoKQo+IC0gaW1wcm92ZWQga2Vy
bmVsLWRvYyBmb3IgdGhlIGRkYyBmaWVsZCBvZiBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcgo+IC0gYWRk
ZWQgUmV2aWV3ZWQtYnkgaW4gcGF0Y2hlcyAxNyBhbmQgMTgKPiAtIGFkZGVkIEFja2VkLWJ5IGlu
IHBhdGNoIDIKPiAtIG1hZGUgdGhlIG93bmVyc2hpcCBvZiBkZGMgaTJjX2FkYXB0ZXIgZXhwbGlj
aXQgaW4gYWxsIHBhdGNoZXMsCj4gdGhpcyBtYWRlIHRoZSBhZmZlY3RlZCBwYXRjaGVzIG11Y2gg
c2ltcGxlcgo+IAo+IEBCZW5qYW1pbgo+IEBTaGF3bgo+IAo+IFRoZXJlIHdlcmUgeW91ciBBY2tl
ZC1ieSBvciBSZXZpZXdlZC1ieSBmb3Igc29tZSBwYXRjaGVzIGluIHY0LCBidXQgbm93Cj4gdGhh
dCB0aGUgcGF0Y2hlcyB1c2UgdGhlIG5ld2x5IGFkZGVkIGZ1bmN0aW9uIEknbSBub3Qgc3VyZSBJ
IGNhbiBzdGlsbAo+IGluY2x1ZGUgdGhvc2UgdGFncyB3aXRob3V0IHlvdSBhY3R1YWxseSBjb25m
aXJtaW5nLiBDYW4gST8gT3IgY2FuIHlvdQo+IHBsZWFzZSByZS1yZXZpZXc/IAo+IAo+IFRPRE86
IG5vdXZlYXUsIGdtYTUwMCwgb21hcGRybSwgcGFuZWwtc2ltcGxlIC0gaWYgYXBwbGljYWJsZS4K
PiBPdGhlciBkcml2ZXJzIGFyZSBlaXRoZXIgYWxyZWFkeSBjb252ZXJ0ZWQgb3IgZG9uJ3QgbWVu
dGlvbiBuZWl0aGVyCj4gImRkYyIgbm9yICJpMmNfYWRhcHRlciIuCj4gCkFub3RoZXIgd2F5IHRv
IGNoZWNrIGlzIHRvIGxvb2sgZm9yIGRybV9nZXRfZWRpZC4gU2FkbHkgdGhhdCBhbHNvCmhpZ2hs
aWdodHMgYXV4LiBkcC9tc3QgaW5zdGFuY2VzLCB3aGljaCBleHBvc2UgdGhlIEREQyBpbiBhbm90
aGVyIHdheS4KCkZvciBleGFtcGxlIGNvbXBhcmluZyB0aGUgZGlmZiBzdGF0IHdydCB0aGUgZm9s
bG93aW5nIGNvbW1hbmQgc2hvd3MKZ2l0IGdyZXAgLXdjIGRybV9nZXRfZWRpZCAtLSBkcml2ZXJz
L2dwdS9kcm0vCgo+IAo+ICAuLi4vZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jb25uZWN0b3Jz
LmMgICAgfCAgOTYgKysrKysrKystLS0tCmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtX2hlbHBlcnMuYzoxCi0gYXMgcG9pbnRlZCBvdXQgYnkgQWxleCAtIG1p
eCBvZiBhdXggZHAvbXN0IGFuZCBub3JtYWwKCj4gIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21v
ZGUuYyAgICAgICAgICAgICAgICB8ICAxMyArLQoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hbmFs
b2dpeC1hbng3OHh4LmM6MQpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2FuYWxvZ2l4L2FuYWxvZ2l4
X2RwX2NvcmUuYzoxCi0gbm90IGFwcGxpY2FibGU6IGF1eCBkcC9tc3QKCgo+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2R1bWItdmdhLWRhYy5jICAgICAgICAgfCAgIDYgKy0KCmRyaXZlcnMvZ3B1
L2RybS9icmlkZ2Uvc2lpOTAyeC5jOjEKLSBub3JtYWwgaW5zdGFuY2UoPykgdGhhdCBzaG91bGQg
YmUgdXBkYXRlZCBhdCBzb21lIHBvaW50LgoKPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1oZG1pLmMgICAgIHwgICA2ICstCgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmM6MQotIG5vdCBhcHBsaWNhYmxlOiBhdXggZHAvbXN0Cgo+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RpLXRmcDQxMC5jICAgICAgICAgICAgfCAgIDYgKy0KCmRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmM6MwotIG5vdCBhcHBsaWNhYmxlOiBhdXggZHAvbXN0Cgo+ICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgICAgICAgICAgfCAgMzUgKysrKysK
PiAgZHJpdmVycy9ncHUvZHJtL2RybV9zeXNmcy5jICAgICAgICAgICAgICAgICAgIHwgICA4ICsK
CmRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jOjcKZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9o
ZWxwZXIuYzoxCi0gdW5yZWxhdGVkCgo+ICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19o
ZG1pLmMgICAgICAgICAgfCAgIDYgKy0KCmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvY2R2X2ludGVs
X2RwLmM6Mwpkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL2Nkdl9pbnRlbF9oZG1pLmM6Mgpkcml2ZXJz
L2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2hkbWkuYzoxCmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAv
b2FrdHJhaWxfbHZkcy5jOjIKZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfaW50ZWxfbW9kZXMu
YzoxCmRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvcHNiX2ludGVsX3Nkdm8uYzoyCi0gc2hvdWxkIGJl
IHVwZGF0ZWQgYXQgc29tZSBwb2ludCAoYXMgeW91IHBvaW50ZWQgb3V0KS4KCj4gIGRyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgICB8ICAxMiArLQpkcml2ZXJzL2dw
dS9kcm0vaTkxNS9pbnRlbF9jb25uZWN0b3IuYzoxCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2NydC5jOjIKLSBub3QgdG9vIHN1cmUgaGVyZQoKZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
ZHAuYzoyCi0gbm90IGFwcGxpY2FibGU6IGF1eCBkcC9tc3QKCmRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX2x2ZHMuYzoxCmRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX3Nkdm8uYzoyCi0gbm90
IHRvbyBzdXJlIGhlcmUKCgo+ICBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1sZGIuYyAgICAgICAg
ICAgICAgICAgfCAgIDcgKy0KPiAgZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtdHZlLmMgICAgICAg
ICAgICAgICAgIHwgICA2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRtaS5j
ICAgICAgICAgICB8ICAgNyArLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21v
ZGUuYyAgICAgICAgfCAgMTMgKy0KPiAgZHJpdmVycy9ncHUvZHJtL21zbS9oZG1pL2hkbWlfY29u
bmVjdG9yLmMgICAgIHwgICA2ICstCmRyaXZlcnMvZ3B1L2RybS9tc20vZWRwL2VkcF9jdHJsLmM6
MQotIG5vdCBhcHBsaWNhYmxlOiBhdXggZHAvbXN0Cgpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
b3V2ZWF1X2Nvbm5lY3Rvci5jOjIKLSBzaG91bGQgYmUgdXBkYXRlZCBhdCBzb21lIHBvaW50IChh
cyB5b3UgcG9pbnRlZCBvdXQpLgoKCmRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YzoxCi0gbm8gYXBwbGljYWJsZTogcGFuZWwgZHJpdmVyCgoKPiAgZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fY29ubmVjdG9ycy5jICAgIHwgMTQyICsrKysrKysrKysrKystLS0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvaW5ub19oZG1pLmMgICAgICAgICAgfCAgIDYgKy0KPiAg
ZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JrMzA2Nl9oZG1pLmMgICAgICAgIHwgICA3ICstCj4g
IGRyaXZlcnMvZ3B1L2RybS9zdGkvc3RpX2hkbWkuYyAgICAgICAgICAgICAgICB8ICAgNiArLQo+
ICBkcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfaGRtaV9lbmMuYyAgICAgICAgfCAgIDcgKy0K
PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2hkbWkuYyAgICAgICAgICAgICAgICAgIHwgICA3ICst
Cj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYyAgICAgICAgICAgICAgICAgICB8ICAgNyAr
LQoKZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jOjEKLSBhbHJlYWR5IGhhbmRsZWQgaW4g
aGRtaS9zb3IKCj4gIGRyaXZlcnMvZ3B1L2RybS90aWxjZGMvdGlsY2RjX3RmcDQxMC5jICAgICAg
ICB8ICAgNiArLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMgICAgICAgICAgICAg
ICAgfCAgMTIgKy0KPiAgZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9oZG1pLmMgICAgICAgICAgICAg
ICAgIHwgICA2ICstCj4gIGRyaXZlcnMvZ3B1L2RybS96dGUvenhfdmdhLmMgICAgICAgICAgICAg
ICAgICB8ICAgNiArLQo+ICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggICAgICAgICAgICAg
ICAgICAgfCAgMTggKysrCj4gIDI2IGZpbGVzIGNoYW5nZWQsIDMzNiBpbnNlcnRpb25zKCspLCAx
MjEgZGVsZXRpb25zKC0pCgpJbiBhIFRsO0RyOiBJIHRoaW5rIHRoaXMgc2VyaWVzIGNvdmVycyA5
MCUrIG9mIHRoZSBleGlzdGluZyByYXRoZXIgaHVnZSkgZHJpdmVyc2V0LgoKRm9yIHRoZSBzZXJp
ZXM6ClJldmlld2VkLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29t
PgoKRndpdyBJJ20gaW4gZmF2b3VyIG9mIEphbmkncyBzdWdnZXN0aW9uIHRvIGZvbGQgdGhlIGRj
YyBpbnRvIHRoZSB1c3VhbApoZWxwZXIgZHJtX2Nvbm5lY3Rvcl9pbml0KCkuIEFsdGhvdWdoIHNp
bmNlIHdlIGhhdmUgMTMwKyBpbnN0YW5jZXMgaXQKbWlnaHQgYmUgYmV0dGVyIGxlZnQgZm9yIGFu
b3RoZXIgZGF5LgoKSFRICi1FbWlsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
