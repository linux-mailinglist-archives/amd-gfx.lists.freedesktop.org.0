Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CAB923E5
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Aug 2019 14:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8C0899C4;
	Mon, 19 Aug 2019 12:54:48 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEFB36E104
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 11:28:41 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id x4so3387681iog.13
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Aug 2019 04:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=P8+V0rYAbzT4+7BmpxUGgA4CrcxqZmpMKL9JE20YblfbBHl4J2SMwJhJg4IxlsQdn5
 nkoqzFrKHbYDKtik2mpzMeUO18AuyGv048YJC8cmVRRp6TMAS9nDFNbCWGQdAudfCnOu
 dosY0G7iqZ3izzUYgAlfJJiUe/rcgdMgkPGaBq/OAAWeMZueqDcbLqG4KnMK8aJrmQWW
 E8JFeiR5HxXaXgGqKniSXWyRaIieQOSlWvnu6U7EPdT6x7iqiuuTohChfkD8mSNGKd5C
 kGUGai/FsILotgiaq5f8Ot7NNOd8pnu3fpk32gKtPl4cXtOgppsXPWln4uNKkgPrG0J2
 OWPg==
X-Gm-Message-State: APjAAAUrrfJ/8WexvYwwKHcULK1zVBSzifg/sgmlPWd4XX4moF2YQJ4y
 AO+Uh8bXhrU13szwD7QOWBsI8Q9LJ0zcwHj0a7YuhA==
X-Google-Smtp-Source: APXvYqws9l57+4N1t5CybQVbaJVVd9Nfbb44LfgnzTxj+oSX0EqosHdKwwu2xUgfJeO4/2mhYPOE0MJ85EFvW0XmVeo=
X-Received: by 2002:a02:ca0c:: with SMTP id i12mr25223915jak.82.1566214120815; 
 Mon, 19 Aug 2019 04:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
From: Dariusz Marcinkiewicz <darekm@google.com>
Date: Mon, 19 Aug 2019 13:28:29 +0200
Message-ID: <CALFZZQHu1C_8idxkwjBdxpW=y9gKmDnLOeTHZ9iAkNo7YubZHg@mail.gmail.com>
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-Mailman-Approved-At: Mon, 19 Aug 2019 12:54:46 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pUgp/lYE2mh6lZVjp7CtML4dZtKS5hCiUObTY5MOrek=;
 b=VomSogBR+Rjw/zSHOgYzWP0EPLOWDtlkOX71pe6ugmjomlrnQcTpcjmO8sKNJJVF88
 eBBJwuHQMPRsPnPRI1d3VWz79WvjiSugyn9jqibRlINZRgvgDoPjI2EtLD1fnsLV99c2
 ShCoueTKwSrH6XIpq3jwrrr8LQOc+bXuyUl/de11l4GYIgokqYrOeou3Ki93L+WqlQJx
 GBubyAUF11lufOEIB4UNoLNvXP6xnBfxBWyQ5xpZJrGplgu4FdH8bkcGeEjP/ZaKEtLl
 6ea5JCPDW1r6tJ7EqnwrgEoniW2UAOXZ55UlUK2Muaf/SGJ0KQMtvI49SO35Tby1zv3b
 l6BQ==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 Allison Randal <allison@lohutok.net>, nouveau@lists.freedesktop.org,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Thomas Lim <Thomas.Lim@amd.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCBBdWcgMTksIDIwMTkgYXQgMTE6MzggQU0gSGFucyBWZXJrdWlsIDxodmVya3VpbC1j
aXNjb0B4czRhbGwubmw+IHdyb3RlOgo+Cj4gSGkgYWxsLAo+CkhpIEhhbnMuCj4gVGhlIHBhdGNo
ZXMgaW4gdGhpcyBzZXJpZXMgY2FuIGJlIGFwcGxpZWQgaW5kZXBlbmRlbnRseSBmcm9tIGVhY2gg
b3RoZXIuCj4KPiBJZiB5b3UgbWFpbnRhaW4gb25lIG9mIHRoZXNlIGRyaXZlcnMgYW5kIHlvdSB3
YW50IHRvIG1lcmdlIGl0IGZvciB2NS40Cj4geW91cnNlbGYsIHRoZW4gcGxlYXNlIGRvIHNvIGFu
ZCBsZXQgbWUga25vdy4gSWYgeW91IHByZWZlciBJIGNvbW1pdCBpdAo+IHRvIGRybS1taXNjLCB0
aGVuIHBsZWFzZSByZXZpZXcgYW5kIChob3BlZnVsbHkpIEFjayB0aGUgcGF0Y2guCj4KPiBJIHdv
dWxkIHJlYWxseSBsaWtlIHRvIGdldCB0aGlzIGluIGZvciB2NS40IHNvIEkgY2FuIGdldCB0aGUg
dXNlcnNwYWNlCj4gYml0cyBpbiBmb3IgdjUuNCBhcyB3ZWxsIHRocm91Z2ggdGhlIG1lZGlhIHN1
YnN5c3RlbS4KPgo+IERhcml1c3osIGNhbiB5b3UgcG9zdCBhIHY3LjEgZm9yIHBhdGNoIDUvOSBm
aXhpbmcgdGhlIHR5cG8/Cj4KRG9uZS4KCkkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byB0ZXN0
IHY3IGNoYW5nZXMgdG8gZHctaGRtaSBhbmQgdGRhOTk4eCBvbgphIHJlYWwgaGFyZHdhcmUuIEhh
bnMsIGRvIHlvdSB0aGluayB5b3Ugd291bGQgYmUgYWJsZSB0byB0ZXN0IHRob3NlPwoKVGhhbmsg
eW91LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQt
Z2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
