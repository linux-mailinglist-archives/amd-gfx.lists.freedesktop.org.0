Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0592ABDF5
	for <lists+amd-gfx@lfdr.de>; Mon,  9 Nov 2020 14:57:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C6D899F3;
	Mon,  9 Nov 2020 13:57:09 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 933E989916
 for <amd-gfx@lists.freedesktop.org>; Mon,  9 Nov 2020 11:06:12 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h2so7579384wmm.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 09 Nov 2020 03:06:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/TTLN5u5ntD12Tf50xVKp1qDLZNw1PZvWBuHFthUL88=;
 b=TKPmIbHz/sJNchjhXki9tBdowYhfzhopEljHcLDYcu2bt52SrzWKjteWCU58KX353a
 /P/wKKssgcalNm6WMoiInsUU0tYzqmWTdvvP1x2IC4lMkbZRYpg+8gP5TNFHScYSbQbf
 zNFvHFuDW2gZ2fs7lZw50G9oLfMph4J7tRayNoOEWmnQba2vledcJcf/7z8jURCZlZ7a
 q1nHIvFPWzIZXH/8EdX8up20/kjt7+d1ENZ+xWOQBxc7IIpx9GwZzr2Y1ubWdpjsgzd2
 Ul6YISZB4Gbk64r1IG9P7c6sH25ulfmr2nRzCJeRtHvEfs63vwtVjnue1xJMXbGaFrRS
 Tfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/TTLN5u5ntD12Tf50xVKp1qDLZNw1PZvWBuHFthUL88=;
 b=h355plvxVWQ58PR9MQdrudv1Tnwp3Nz5Z21KTRbGXM/GYhJ0fj+UKvT0kboalzJ6G0
 TsjQtV+xaN8Y9Bfl2btwHHWf6089a+N68hbnePZKGyo/hgMLUAuLOw+LXwTTuJoIbKRj
 jiblbqHRrJyfNzhfCEZsMl6qnnujejO1ZKPbbMSIowCq2WPx9Bqh2jFpE9pOPlssx0CT
 oaPWjdq7zKoy83t6SceyKrOjGR03kur3KpNWkwlWqqxJbsJl5hdYlRFRg1/ODTJkg5lq
 8aZbDEN6AteZt+37Hixha6qmt0oevXmFXbG7m/QirYJqBrctFMrY3agzrN0FX2qbQoZl
 2Uow==
X-Gm-Message-State: AOAM533K4HHWP5MeNnVTUbIIDrH5tZ1LHK0KOiLjOSpRFS/pzN7RVrpz
 bcCyUktdbv39tPKNfnv/fjnbSQ==
X-Google-Smtp-Source: ABdhPJwCQni2iqmE/lW8/SqfwjZzXNoAzBmb14stJp2vUaJpNmwq4rT99zQtmmQXUZir2cge7Fg/tA==
X-Received: by 2002:a1c:67d5:: with SMTP id b204mr14273334wmc.92.1604919971242; 
 Mon, 09 Nov 2020 03:06:11 -0800 (PST)
Received: from dell ([91.110.221.180])
 by smtp.gmail.com with ESMTPSA id h62sm13193538wrh.82.2020.11.09.03.06.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 03:06:10 -0800 (PST)
Date: Mon, 9 Nov 2020 11:06:03 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 10/19] drm/radeon/radeon: Move prototype into shared header
Message-ID: <20201109110603.GV2063125@dell>
References: <20201106214949.2042120-1-lee.jones@linaro.org>
 <20201106214949.2042120-11-lee.jones@linaro.org>
 <20201107142651.GA1014611@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107142651.GA1014611@ravnborg.org>
X-Mailman-Approved-At: Mon, 09 Nov 2020 13:57:08 +0000
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gU2F0LCAwNyBOb3YgMjAyMCwgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPiBIaSBMZWUsCj4gCj4g
T24gRnJpLCBOb3YgMDYsIDIwMjAgYXQgMDk6NDk6NDBQTSArMDAwMCwgTGVlIEpvbmVzIHdyb3Rl
Ogo+ID4gVW5mb3J0dW5hdGVseSwgYSBzdWl0YWJsZSBvbmUgZGlkbid0IGFscmVhZHkgZXhpc3Qu
Cj4gPiAKPiA+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+ID4gCj4gPiAgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNlLmM6NjM3OjY6
IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYcmFkZW9uX2RldmljZV9pc192
aXJ0dWFs4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiA+ICA2MzcgfCBib29sIHJhZGVvbl9k
ZXZpY2VfaXNfdmlydHVhbCh2b2lkKQo+ID4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+Cj4g
PiAKPiA+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gPiBD
YzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4KPiA+IENjOiBTdW1pdCBTZW13YWwgPHN1bWl0LnNlbXdhbEBsaW5hcm8u
b3JnPgo+ID4gQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiBDYzogZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVs
Lm9yZwo+ID4gQ2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwo+ID4gU2lnbmVkLW9m
Zi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4KPiA+IC0tLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5jIHwgIDEgKwo+ID4gIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2RldmljZS5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysr
KysKPiA+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYyAgICB8ICAzICstLQo+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGV2aWNl
LmgKPiAKPiBPdGhlciBwdWJsaWMgZnVuY3Rpb25zIGluIHJhZGVvbl9kZXZpY2UuYyBoYXZlIHRo
ZWlyIHByb3RvdHlwZSBpbgo+IHJhZGVvbi5oIC0gZm9yIGV4YW1wbGUgcmFkZW9uX2lzX3B4KCkK
PiAKPiBBZGQgcmFkZW9uX2RldmljZV9pc192aXJ0dWFsKCkgdGhlcmUgc28gd2UgYXZvaWlkIHRo
aXMgbmV3IGhlYWRlci4KCk9oIHllcywgSSByZW1lbWJlciB3aHkgdGhpcyB3YXNuJ3QgYSBzdWl0
YWJsZSBzb2x1dGlvbiBub3c6CgpUaGUgbWFjcm8gInJhZGVvbl9pbml0IiBpbiByYWRlb24uaCBj
bGFzaGVzIHdpdGggdGhlIGluaXQgZnVuY3Rpb24gb2YKdGhlIHNhbWUgbmFtZSBpbiByYWRlb25f
ZHJ2LmM6CgogIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYzo1MzoKICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYzo2MjA6
MzE6IGVycm9yOiBleHBlY3RlZCBpZGVudGlmaWVyIG9yIOKAmCjigJkgYmVmb3JlIOKAmHZvaWTi
gJkKICA2MjAgfCBzdGF0aWMgaW50IF9faW5pdCByYWRlb25faW5pdCh2b2lkKQogIHwgXn5+fgog
IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmg6MjcwNToyODogbm90ZTogaW4gZGVmaW5p
dGlvbiBvZiBtYWNybyDigJhyYWRlb25faW5pdOKAmQogIDI3MDUgfCAjZGVmaW5lIHJhZGVvbl9p
bml0KHJkZXYpIChyZGV2KS0+YXNpYy0+aW5pdCgocmRldikpCiAgfCBefn5+CiAgSW4gZmlsZSBp
bmNsdWRlZCBmcm9tIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOjM1OgogIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOiBJbiBmdW5jdGlvbiDigJhfX2luaXR0
ZXN04oCZOgogIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOjY1MzoxMzogZXJy
b3I6IOKAmHJhZGVvbl9pbml04oCZIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0
aW9uKTsgZGlkIHlvdSBtZWFuIOKAmHJhZGVvbl9leGl04oCZPwogIDY1MyB8IG1vZHVsZV9pbml0
KHJhZGVvbl9pbml0KTsKICB8IF5+fn5+fn5+fn5+CiAgaW5jbHVkZS9saW51eC9tb2R1bGUuaDox
MzM6MTE6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYbW9kdWxlX2luaXTigJkKICAx
MzMgfCB7IHJldHVybiBpbml0Zm47IH0gfCBefn5+fn4KICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9kcnYuYzo2NTM6MTM6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlz
IHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluCiAgNjUz
IHwgbW9kdWxlX2luaXQocmFkZW9uX2luaXQpOwogIHwgXn5+fn5+fn5+fn4KICBpbmNsdWRlL2xp
bnV4L21vZHVsZS5oOjEzMzoxMTogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhtb2R1
bGVfaW5pdOKAmQogIDEzMyB8IHsgcmV0dXJuIGluaXRmbjsgfSB8IF5+fn5+fgogIEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6NjUsCiAgZnJvbSA8
Y29tbWFuZC1saW5lPjoKICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYzogQXQg
dG9wIGxldmVsOgogIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jOjY1MzoxMzog
ZXJyb3I6IOKAmHJhZGVvbl9pbml04oCZIHVuZGVjbGFyZWQgaGVyZSAobm90IGluIGEgZnVuY3Rp
b24pOyBkaWQgeW91IG1lYW4g4oCYcmFkZW9uX2V4aXTigJk/CiAgNjUzIHwgbW9kdWxlX2luaXQo
cmFkZW9uX2luaXQpOwogIHwgXn5+fn5+fn5+fn4KICBpbmNsdWRlL2xpbnV4L2NvbXBpbGVyX2F0
dHJpYnV0ZXMuaDoxMDk6NjU6IG5vdGU6IGluIGRlZmluaXRpb24gb2YgbWFjcm8g4oCYX19jb3B5
4oCZCiAgMTA5IHwgIyBkZWZpbmUgX19jb3B5KHN5bWJvbCkgX19hdHRyaWJ1dGVfXygoX19jb3B5
X18oc3ltYm9sKSkpCiAgfCBefn5+fn4KICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9k
cnYuYzo2NTM6MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1vZHVsZV9pbml04oCZ
CiAgNjUzIHwgbW9kdWxlX2luaXQocmFkZW9uX2luaXQpOwogIHwgXn5+fn5+fn5+fn4KICBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmM6MzU6
CiAgaW5jbHVkZS9saW51eC9tb2R1bGUuaDoxMzQ6NjogZXJyb3I6IOKAmGluaXRfbW9kdWxl4oCZ
IGFsaWFzZWQgdG8gdW5kZWZpbmVkIHN5bWJvbCDigJhyYWRlb25faW5pdOKAmQogIDEzNCB8IGlu
dCBpbml0X21vZHVsZSh2b2lkKSBfX2NvcHkoaW5pdGZuKSBfX2F0dHJpYnV0ZV9fKChhbGlhcygj
aW5pdGZuKSkpOwogIHwgXn5+fn5+fn5+fn4KICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kcnYuYzo2NTM6MTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1vZHVsZV9pbml0
4oCZCiAgNjUzIHwgbW9kdWxlX2luaXQocmFkZW9uX2luaXQpOwogIHwgXn5+fn5+fn5+fn4KCkhv
dyB3b3VsZCB5b3UgbGlrZSBtZSB0byBtb3ZlIGZvcndhcmQ/CgotLSAKTGVlIEpvbmVzIFvmnY7n
kLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8u
b3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzog
RmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2FtZC1nZngK
