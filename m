Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7629A26C352
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Sep 2020 15:36:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39576EA23;
	Wed, 16 Sep 2020 13:36:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1726E95A;
 Wed, 16 Sep 2020 13:36:41 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id m6so7004627wrn.0;
 Wed, 16 Sep 2020 06:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=r5jUXeSw/4ggqv8IN7COH2Z5GZeDPF7AGOPBRf1SYI0=;
 b=ig6ZQKRGLyN6XNhUpuB/u1pVkJdj64SQdhmlbQamjF9zW8WxwgHX1uqj35w+Xh2ZnA
 lD5sTpJuT/IFOZ+atqmjosTryiHlchqSSgFArIFZ8STOIm6Z2qcBbzFDFQEZBWNSOk/p
 aMuxEjt3Wz+xLbTA+ufEdFluAW6+dOhwH08vfKdYOvFPArPtyQ+XIEIMa6yIKdHZp0tm
 y9HTxRGTWaNMz1g9BYfpbfgTQzTiln06WuohZir74vPBN10YC79eL23pvynVfE/wEbsx
 Ow0vPp2hHlmqLC79I/m/Bsn/ABVTMxAvXJcvMmF0jGh3F9GdQQn3nS5p6Qx7uPI6Tg33
 BghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=r5jUXeSw/4ggqv8IN7COH2Z5GZeDPF7AGOPBRf1SYI0=;
 b=NNW8t0SA10tLGb/XT/TWzRGf4uZcDY5wluQYOZuySIKT7v9jwIIPgj0O5g8XaMalG0
 nMf6aQkta93OaFQgEJc9Z6OxzGveKgMSBPXDe1fpUCtLXCaunjCqDjjEJwa4j/abx5xY
 I5BJ4s5qM7mDpn17O3o/Ppw5qr9Zb+qXAdz+jZqd9Dgtv1y0ih2+MYWSVHySV3vcgfRh
 qIsnLT6kZXl/Riy1W0TuhbVkrsCc3jhNBBTM1lGmPU0M4DUd14BmnZfU432oL1/sffJC
 zfaODycYpH4HkoZI522rg/72MJDDW7ezr6gWeNlIu4xWcbiidgd7ET/avoXhRSbm7V5I
 oi3Q==
X-Gm-Message-State: AOAM5335JdcuESENidywAaMqEnelTta15HGztgGIBFePXh0EhmxsNicz
 wkMgeQBNckgXkuTKAxKpmYcKhZ19z+ojjvhyoac=
X-Google-Smtp-Source: ABdhPJz0EHmnPCfH0eRO3mR2rVLD52zmKN9kD0WOxU4XQOjqSUjfS6kR79//Svvg/jabT/LHpVLj1OT8TcgFsVfvbkw=
X-Received: by 2002:adf:f290:: with SMTP id k16mr28611770wro.124.1600263399711; 
 Wed, 16 Sep 2020 06:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
 <20200915193549.GP6112@intel.com>
 <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
 <20200916075156.GU438822@phenom.ffwll.local>
In-Reply-To: <20200916075156.GU438822@phenom.ffwll.local>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 16 Sep 2020 09:36:28 -0400
Message-ID: <CADnq5_OS814FxmadZ9yBkrY6ije8h7FxswWstsxNr3rw=Bum=Q@mail.gmail.com>
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
To: Christian Koenig <christian.koenig@amd.com>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Alex Deucher <alexdeucher@gmail.com>, yi.zhang@huawei.com,
 Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Zheng Bin <zhengbin13@huawei.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMzo1MSBBTSBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOgo+Cj4gT24gV2VkLCBTZXAgMTYsIDIwMjAgYXQgMDk6Mzg6MzRBTSArMDIw
MCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiA+IEFtIDE1LjA5LjIwIHVtIDIxOjM1IHNjaHJp
ZWIgVmlsbGUgU3lyasOkbMOkOgo+ID4gPiBPbiBUdWUsIFNlcCAxNSwgMjAyMCBhdCAwMzoxNjoz
MlBNIC0wNDAwLCBBbGV4IERldWNoZXIgd3JvdGU6Cj4gPiA+ID4gSSBxdWVzdGlvbiB0aGUgdmFs
dWUgb2YgdGhlc2Ugd2FybmluZ3MuICBXaHkgZXZlbiBoYXZlIGEgYm9vbGVhbiB0eXBlCj4gPiA+
ID4gaWYgeW91IGFyZSBnb2luZyB0byBnZXQgd2FybmluZ3Mgd2hlbiB5b3UgdXNlIHRoZW0uLi4K
PiA+ID4gPiBUaGF0IHNhaWQsIGFwcGxpZWQgdG8gYXZvaWQgZ2V0dGluZyB0aGVzZSBwYXRjaGVz
IGFnYWluIGFuZCBhZ2Fpbgo+ID4gPiA+IGV2ZXJ5IHRpbWUgc29tZW9uZSBzZWVzIHRoaXMuCj4g
PiA+IGlmICh0aGlzX2lzX3NwYXJ0YSkKPiA+ID4gaWYgKHRoaXNfaXNfc3BhcnRhID09IHRydWUp
Cj4gPiA+IGlmICh0aGlzX2lzX3NwYXJ0YSAhPSBmYWxzZSkKPiA+ID4KPiA+ID4gSSB0aGluayB0
aGUgZmlyc3Qgb25lIHJlYWRzIHRoZSBiZXN0LCBhbmQgYXZvaWRzIGhhdmluZyB0bwo+ID4gPiBk
ZWNpZGUgYmV0d2VlbiB0cnV0aCBhbmQgZmFsc2Vob29kIDopCj4gPgo+ID4gKzEKPgo+ICsxLCBl
c3BlY2lhbGx5IGJlY2F1c2Ugd2UgYWxzbyBoYXZlIHRoZSBpbnZlcnNpb24gd2hlbiB1c2luZyBu
ZWdhdGl2ZQo+IGVycm5vIGNvZGVzIGZvciBmYWlsdXJlcyBhbmQgMCBhcyBzdWNjZXNzLCB3aGlj
aCByZXN1bHRzIGluCj4KPiAgICAgICAgIGlmIChlcnJubyA9PSAwKSAvKiBzdWNjZXNzIGNhc2Ug
Ki8KPgo+IGJ1dAo+ICAgICAgICAgaWYgKGJvb2wgPT0gMCkgLyogZmFpbHVyZSBjYXNlICovCj4K
PiBub3cgY3JlYXRpdmUgcGVvcGxlIGRvIHNvbWV0aW1lcwo+Cj4gICAgICAgICBpZiAoIWVycm5v
KSAvKiBzdWNjZXNzIGNhc2UgKi8KPgo+IHdoaWNoIEkgdGhpbmsgaXMgaG9ycmlibHkgY29uZnVz
aW5nLiBTbyBpbW8gZm9yIG1vcmUgZWFzaWVyIHRlbGxpbmcgYXBhcnQKPiBvZiB0aGVzZSB0b28g
SSB0aGluayBjb25zaXN0ZW50bHkgdXNpbmcgdGhlIHNob3J0IGZvcm0gZm9yIGJvb2xlYW5zLCBh
bmQKPiBjb25zaXN0ZW50bHkgdXNpbmcgdGhlIG1vcmUgZXhwbGljaXQgbG9uZyBmb3JtIGZvciBl
cnJubyBjaGVja3MgaXMgYSBWZXJ5Cj4gR29vZCBQYXR0ZXJuIDotKQoKSSBkb24ndCBkaXNhZ3Jl
ZSB3aXRoIHlvdXIgbG9naWMsIGJ1dCB3ZSByZWd1bGFybHkgZ2V0IHBhdGNoZXMgdG8KY29udmVy
dCBlcnJubyBjaGVja3MgdG8gZHJvcCB0aGUgZGlyZWN0IGNvbXBhcmlzb24gYmVjYXVzZSB0aGF0
IGlzIHRoZQoicHJlZmVycmVkIGtlcm5lbCBzdHlsZSIuICBBcmd1YWJseSwgd2Ugc2hvdWxkIGJl
IGV4cGxpY2l0IGluIGFsbApjYXNlcyBhcyB0aGF0IGF2b2lkcyBhbGwgY29uZnVzaW9uLiAgV2l0
aCB0aGF0IGluIG1pbmQsIG15IG9yaWdpbmFsCnBvaW50IHN0YW5kcy4gIFdoeSBoYXZlIGEgdHlw
ZSB3aGVuIGNvbXBhcmlzb25zIGFnYWluc3QgdmFsaWQgc2V0dGluZ3MKZm9yIHRoYXQgdHlwZSBw
cm9kdWNlIGVycm9ycz8KCkFsZXgKCj4KPiBDaGVlcnMsIERhbmllbAo+Cj4gPgo+ID4gQ2hyaXN0
aWFuLgo+ID4KPiA+ID4KPiA+ID4gPiBBbGV4Cj4gPiA+ID4KPiA+ID4gPiBPbiBXZWQsIFNlcCA5
LCAyMDIwIGF0IDk6MjEgQU0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPiA+ID4gPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+IGZvciB0aGUgc2VyaWVzLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEFt
IDA5LjA5LjIwIHVtIDE1OjA3IHNjaHJpZWIgWmhlbmcgQmluOgo+ID4gPiA+ID4gPiBaaGVuZyBC
aW4gKDgpOgo+ID4gPiA+ID4gPiAgICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBv
aW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIGdmeF92OV8wLmMKPiA+ID4gPiA+ID4gICAgIGRybS9h
bWQvYW1kZ3B1OiBmaXggY29tcGFyaXNvbiBwb2ludGVyIHRvIGJvb2wgd2FybmluZyBpbiBnZnhf
djEwXzAuYwo+ID4gPiA+ID4gPiAgICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBv
aW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjVfMC5jCj4gPiA+ID4gPiA+ICAgICBkcm0v
YW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gc2Rt
YV92NV8yLmMKPiA+ID4gPiA+ID4gICAgIGRybS9hbWQvYW1kZ3B1OiBmaXggY29tcGFyaXNvbiBw
b2ludGVyIHRvIGJvb2wgd2FybmluZyBpbiBzaS5jCj4gPiA+ID4gPiA+ICAgICBkcm0vYW1kL2Ft
ZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gdXZkX3Y2XzAu
Ywo+ID4gPiA+ID4gPiAgICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIg
dG8gYm9vbCB3YXJuaW5nIGluCj4gPiA+ID4gPiA+ICAgICAgIGFtZGdwdV9hdHB4X2hhbmRsZXIu
Ywo+ID4gPiA+ID4gPiAgICAgZHJtL2FtZC9hbWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIg
dG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjRfMC5jCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAg
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hdHB4X2hhbmRsZXIuYyB8IDQgKyst
LQo+ID4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYyAg
ICAgICAgICAgfCAyICstCj4gPiA+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2dmeF92OV8wLmMgICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvc2RtYV92NF8wLmMgICAgICAgICAgIHwgNCArKy0tCj4gPiA+ID4gPiA+
ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jICAgICAgICAgICB8IDIg
Ky0KPiA+ID4gPiA+ID4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2RtYV92NV8yLmMg
ICAgICAgICAgIHwgMiArLQo+ID4gPiA+ID4gPiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zaS5jICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4gPiA+ICAgIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgICAgICAgICAgICB8IDQgKystLQo+ID4gPiA+ID4g
PiAgICA4IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQo+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiAtLQo+ID4gPiA+ID4gPiAyLjI2LjAuMTA2Lmc5ZmFkZWRk
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gPiA+ID4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiA+ID4gPiA+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4gPiBodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiA+ID4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gPiA+IGRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+ID4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gPiA+ID4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
PiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwKPgo+IC0tCj4gRGFuaWVsIFZldHRlcgo+IFNvZnR3YXJlIEVuZ2luZWVyLCBJbnRl
bCBDb3Jwb3JhdGlvbgo+IGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vYW1kLWdmeAo=
