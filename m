Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8CA747A
	for <lists+amd-gfx@lfdr.de>; Tue,  3 Sep 2019 22:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700AD89308;
	Tue,  3 Sep 2019 20:16:34 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D9189308
 for <amd-gfx@lists.freedesktop.org>; Tue,  3 Sep 2019 20:16:33 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id k20so7459054oih.3
 for <amd-gfx@lists.freedesktop.org>; Tue, 03 Sep 2019 13:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fuNE/PbARI4X1SDUxOJdVor+kM6vEl0qwdmklg5gRIk=;
 b=VYfb3up8Zp0OcXhz535h8cx6EOzZgPhApE/KTB6iygKoXQz9rruzF1fXALDRk8eqYZ
 JYRTovTeH3/1I/qLnsc9pUyUAYQWVnoyWISMFo4vFVgV6yUhu5pISLvElcx+/+EZZg5f
 w2ITymAUSFJwcg/E5W+TFaUQwuL+t3t3m/FZN/6DAvGjD32JMHrTJHZ9tOA/lAUWeVf4
 l4cWAPWB4iyiDQK3KnNpmr51SGnB/qkHiReuQmEyQGqpSVcTvT9yVZiwe2pdFW0MIMsq
 9cTGmccdXLn+TQ+/+rmUaCMoAN5g5WTJBI8TR6KxCHSnyWvgxsLovAeE6jnp1HLOnF2h
 c8Yg==
X-Gm-Message-State: APjAAAUf+zHJB3Otk19gFz9vjYNdhEAfaFPaAY9sxM8ei0Bnoom9MVDE
 ogunngKTAtDqb7ocGagxysc178KhGaLOWPkn1OsX3cfv
X-Google-Smtp-Source: APXvYqybfiWx6mjrzM5ZXEiVGtvosvX11hiUT74UWVUuMP6ub2AGecgFs301Pxu/2I2tVSX5lPGvb8Ws7uu8YHor0Lc=
X-Received: by 2002:aca:e182:: with SMTP id y124mr820605oig.132.1567541792385; 
 Tue, 03 Sep 2019 13:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190903162519.7136-1-sashal@kernel.org>
 <20190903162519.7136-44-sashal@kernel.org>
 <7957107d-634f-4771-327e-99fdd5e6474e@daenzer.net>
 <20190903170347.GA24357@kroah.com> <20190903200139.GJ5281@sasha-vm>
In-Reply-To: <20190903200139.GJ5281@sasha-vm>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 3 Sep 2019 22:16:21 +0200
Message-ID: <CAKMK7uFpBnkF4xABdkDMZ8TYhL4jg6ZuGyHGyVeBxc9rkyUtXQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 4.19 044/167] drm/amdgpu: validate user pitch
 alignment
To: Sasha Levin <sashal@kernel.org>, Dave Airlie <airlied@linux.ie>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fuNE/PbARI4X1SDUxOJdVor+kM6vEl0qwdmklg5gRIk=;
 b=Wp8V5Z1smuTXbcTb6H9dhtUg3fTNi/mBMD9NogWFulevqru5aJyg/yQzbZhd87dUxi
 GW/j6TPJ+e/rsZ29asl2NBU01ok4D9DELsYRWUfiS2R0LRUooQvzgulfFX9enb/cBznF
 xNn2mRFf723WAOBbPHUafZPHQ2U4e7jxWkRvk=
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
Cc: Yu Zhao <yuzhao@google.com>, Greg KH <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCBTZXAgMywgMjAxOSBhdCAxMDowMSBQTSBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDc6MDM6NDdQTSArMDIw
MCwgR3JlZyBLSCB3cm90ZToKPiA+T24gVHVlLCBTZXAgMDMsIDIwMTkgYXQgMDY6NDA6NDNQTSAr
MDIwMCwgTWljaGVsIETDpG56ZXIgd3JvdGU6Cj4gPj4gT24gMjAxOS0wOS0wMyA2OjIzIHAubS4s
IFNhc2hhIExldmluIHdyb3RlOgo+ID4+ID4gRnJvbTogWXUgWmhhbyA8eXV6aGFvQGdvb2dsZS5j
b20+Cj4gPj4gPgo+ID4+ID4gWyBVcHN0cmVhbSBjb21taXQgODlmMjNiNmVmZWY1NTQ3NjYxNzdi
ZjUxYWE3NTRiY2UxNGMzZTdkYSBdCj4gPj4KPiA+PiBIb2xkIHlvdXIgaG9yc2VzIQo+ID4+Cj4g
Pj4gVGhpcyBjb21taXQgYW5kIGM0YTMyYjI2NmRhN2JiNzAyZTYwMzgxY2EwYzM1ZWFkZGJjODlh
NmMgaGFkIHRvIGJlCj4gPj4gcmV2ZXJ0ZWQsIGFzIHRoZXkgY2F1c2VkIHJlZ3Jlc3Npb25zLiBT
ZWUgY29tbWl0cwo+ID4+IDI1ZWM0MjllODZiYjc5MGU0MDM4N2E1NTBmMDUwMWQwYWM1NWE0N2Mg
Jgo+ID4+IDkyYjA3MzBlYWYyZDU0OWZkZmIxMGVjYzhiNzFmMzRiOWY0NzJjMTIgLgo+ID4+Cj4g
Pj4KPiA+PiBUaGlzIGlzbid0IGJvbHN0ZXJpbmcgY29uZmlkZW5jZSBpbiBob3cgdGhlc2UgcGF0
Y2hlcyBhcmUgc2VsZWN0ZWQuLi4KPiA+Cj4gPlRoZSBwYXRjaCBfaXRzZWxmXyBzYWlkIHRvIGJl
IGJhY2twb3J0ZWQgdG8gdGhlIHN0YWJsZSB0cmVlcyBmcm9tIDQuMgo+ID5hbmQgbmV3ZXIuICBX
aHkgd291bGRuJ3Qgd2UgYmUgY29uZmlkZW50IGluIGRvaW5nIHRoaXM/Cj4gPgo+ID5JZiB0aGUg
cGF0Y2ggZG9lc24ndCB3YW50IHRvIGJlIGJhY2twb3J0ZWQsIHRoZW4gZG8gbm90IGFkZCB0aGUg
Y2M6Cj4gPnN0YWJsZSBsaW5lIHRvIGl0Li4uCj4KPiBUaGlzIHBhdGNoIHdhcyBwaWNrZWQgYmVj
YXVzZSBpdCBoYXMgYSBzdGFibGUgdGFnLCB3aGljaCB5b3UgcHJlc3VtYWJseQo+IHNhdyBhcyB5
b3VyIFJldmlld2VkLWJ5IHRhZyBpcyBpbiB0aGUgcGF0Y2guIFRoaXMgaXMgd2h5IGl0IHdhcwo+
IGJhY2twb3J0ZWQ7IGl0IGRvZXNuJ3QgdGFrZSBBSSB0byBiYWNrcG9ydCBwYXRjaGVzIHRhZ2dl
ZCBmb3Igc3RhYmxlLi4uCj4KPiBUaGUgcmV2ZXJ0IG9mIHRoaXMgcGF0Y2gsIGhvd2V2ZXI6Cj4K
PiAgMS4gRGlkbid0IGhhdmUgYSBzdGFibGUgdGFnLgo+ICAyLiBEaWRuJ3QgaGF2ZSBhICJGaXhl
czoiIHRhZy4KPiAgMy4gRGlkbid0IGhhdmUgdGhlIHVzdWFsICJ0aGUgcmV2ZXJ0cyBjb21taXQg
Li4uIiBzdHJpbmcgYWRkZWQgYnkgZ2l0Cj4gIHdoZW4gb25lIGRvZXMgYSByZXZlcnQuCj4KPiBX
aGljaCBpcyB3aHkgd2Ugc3RpbGwga2ljayBwYXRjaGVzIGZvciByZXZpZXcsIGV2ZW4gdGhvdWdo
IHRoZXkgaGFkIGEKPiBzdGFibGUgdGFnLCBqdXN0IHNvIHBlb3BsZSBjb3VsZCB0YWtlIGEgbG9v
ayBhbmQgY29uZmlybSB3ZSdyZSBub3QKPiBtaXNzaW5nIGFueXRoaW5nIC0gbGlrZSB3ZSBkaWQg
aGVyZS4KPgo+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBleHBlY3RlZCBtZSB0byBkbyBkaWZmZXJl
bnRseSBoZXJlLgoKWWVhaCB0aGlzIGxvb2tzIGxpa2UgZmFpbCBvbiB0aGUgcmV2ZXJ0IHNpZGUs
IHRoZXkgbmVlZCB0byByZWZlcmVuY2UKdGhlIHJldmVydGVkIGNvbW1pdCBzb21laG93IC4uLgoK
QWxleCwgd2h5IGdvdCB0aGlzIGRyb3BwZWQ/IElzIHRoaXMgbW9yZSBmYWxsb3V0IGZyb20gdGhl
IGJhY2smZm9ydGgKc2h1ZmZsaW5nIHlvdSdyZSBkb2luZyBiZXR3ZWVuIHlvdXIgaW50ZXJuYWwg
YnJhbmNoZXMgYmVoaW5kIHRoZQpmaXJld2FsbCwgYW5kIHRoZSBwdWJsaWMgaGlzdG9yeT8KCkFs
c28gYWRkaW5nIERhdmUgQWlybGllLgotRGFuaWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJl
IEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6
Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
