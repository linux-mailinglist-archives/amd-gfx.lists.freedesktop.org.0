Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA1919F5ED
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Apr 2020 14:40:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 897B16E3AA;
	Mon,  6 Apr 2020 12:40:03 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4530B6E3AA
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Apr 2020 12:40:03 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id i19so15672713wmb.0
 for <amd-gfx@lists.freedesktop.org>; Mon, 06 Apr 2020 05:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YR20MHMkqspuOgBU7bFniDbW6AoI1XFbpHH872LvReQ=;
 b=sjRnQ0fzzsyYaawxlAHyuO1J5CLibR1PHydTR43rpAm4EnrBlQNkVW0wFqLg9wTeN5
 mHzn/dSawxYXZ8uP7poVQOCdq6Lct3xpy5znO2g4+iUwUZpC6styfI2kezag46CQ4nYf
 aer56z0O1IAAOCCq21JsZ/5MdAtrQ+DA+dWAAfInw4b/mK6GN5S5AT3e9ZQ09orXd8Fw
 JlbcdReofEnIhDOExJAb5sHlgj8KysQuOq2MBgXrIaPVnECYhHx2gVs1AoE6o73NuqId
 SLoPluyaVm5Mno/tsjz5NpT4o/BmOMXLTOqh0xn4nT6eGoUumELpfCc9Pfm5ZLBnbs8E
 E/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=YR20MHMkqspuOgBU7bFniDbW6AoI1XFbpHH872LvReQ=;
 b=JbwUslgAD2NwHT6Ew/T3WR0MV3AEPvQfPv4WxTu7DE1sn5DeILnWR/EJM4/s7+/llv
 mMow3k7yOidaenFw4DcwkIfZbA4QVqeFFEN8bjEXVtCNq4gI8LtZxwrZ4AM15t1OmHrP
 M1I15EO5wXio3zEbqgIgD9xXkLHNcTuFpeQ9aj8GPrDvyIs4wfXcdsPJjPf73hv2n1WG
 vUH1KnBV9eb/1K9RbdwSCn1GEtWz+ZatIBb7uKmp7dSH5V92s9FX+B/yz6kmhjm04VF2
 jjeX7ajnvZ2sV1gL2ytH6iKGXmM6ezmNpDMm6NEoLvCVUj3Mf/l9qlRcVKf2ryG5QXH1
 RWyw==
X-Gm-Message-State: AGi0PuazwnBAzmxGCmnJolY6Xnjk2gXgW47posOOm7XF1xlFdzbYUzd7
 r/2EDD5hwfFchyetyG2W1NaL9zX1
X-Google-Smtp-Source: APiQypKXs8U7xcnAwr5gqbUguKk2xXZhuG7Wg3piFzXXN+s3F0VM35Divi1XUuLW1Z97yRY7OImrkg==
X-Received: by 2002:a1c:8008:: with SMTP id b8mr21833118wmd.43.1586176801578; 
 Mon, 06 Apr 2020 05:40:01 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d6sm26532985wrw.10.2020.04.06.05.40.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Apr 2020 05:40:01 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/vcn: add shared menory restore after wake up
 from sleep.
To: James Zhu <jamesz@amd.com>, christian.koenig@amd.com,
 Alex Deucher <alexdeucher@gmail.com>, James Zhu <James.Zhu@amd.com>
References: <1585918324-16780-1-git-send-email-James.Zhu@amd.com>
 <CADnq5_OwEiyjtfoy4ri+wMt9KTL7cZirrKJFhsQmYncPHSeH-g@mail.gmail.com>
 <62cc4dea-88aa-15cc-cc54-9f5fc5fdea38@amd.com>
 <fd093239-d748-a232-8f96-666753f99a82@gmail.com>
 <faa6f7fd-b173-da00-4af2-c894932e795d@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d3602e60-11d1-9281-7a9e-6279cba2ff28@gmail.com>
Date: Mon, 6 Apr 2020 14:40:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <faa6f7fd-b173-da00-4af2-c894932e795d@amd.com>
Content-Language: en-US
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
Reply-To: christian.koenig@amd.com
Cc: "Li, Pauline" <Pauline.Li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDYuMDQuMjAgdW0gMTQ6MzEgc2NocmllYiBKYW1lcyBaaHU6Cj4KPiBPbiAyMDIwLTA0LTA2
IDM6MDMgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMDMuMDQuMjAgdW0gMTc6
NTQgc2NocmllYiBKYW1lcyBaaHU6Cj4+Pgo+Pj4gT24gMjAyMC0wNC0wMyAxMTozNyBhLm0uLCBB
bGV4IERldWNoZXIgd3JvdGU6Cj4+Pj4gT24gRnJpLCBBcHIgMywgMjAyMCBhdCA4OjUyIEFNIEph
bWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+IHdyb3RlOgo+Pj4+PiBWQ04gc2hhcmVkIG1lbW9y
eSBuZWVkcyByZXN0b3JlIGFmdGVyIHdha2UgdXAgZHVyaW5nIFMzIHRlc3QuCj4+Pj4gSG93IGJp
ZyBpcyB0aGUgc2hhcmVkIG1lbW9yeT/CoCBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gYWxsb2NhdGUg
dGhlCj4+Pj4gbWVtb3J5IG9uY2UgYXQgc3dfaW5pdCBhbmQgdGhlbiBmcmVlIGl0IGluIHN3X2Zp
bmkgcmF0aGVyIHRoYW4KPj4+PiBhbGxvY2F0aW5nIGFuZCBmcmVlaW5nIGluIGV2ZXJ5IHN1c3Bl
bmQvcmVzdW1lLgo+Pj4KPj4+IEhpIEFsZXgsCj4+Pgo+Pj4gQWZ0ZXIgYWxpZ25tZW50LCBpdCBp
cyBvbmx5IDRrLiBJIGNhbiBjaGFuZ2UgaXQgYXMgeW91IHN1Z2dlc3QuCj4+Cj4+IERvZXMgdGhp
cyBuZWVkcyB0byBzdGF5IGF0IHRoZSBzYW1lIHBsYWNlIGFmdGVyIGEgc3VzcGVuZC9yZXN1bWU/
Cj4+Cj4+IFNlZSB3ZSBvbmx5IGJhY2t1cCB0aGUgZmlybXdhcmUgbWFudWFsbHkgYmVjYXVzZSB3
ZSBvdGhlcndpc2UgY2FuJ3QgCj4+IGd1YXJhbnRlZSB0aGF0IGl0IHdpbGwgYmUgbW92ZWQgYmFj
ayB0byB0aGUgc2FtZSBwbGFjZSBhZnRlciByZXN1bWUuCj4gWWVzLCB0aGlzIGlzIHRoZSBjYXNl
Li4gRlcgcmVxdWVzdCB0aGUgc2FtZSBmb3IgdGhlaXIgcmVzdW1lIHByb2Nlc3NpbmcuCj4+IElm
IHRoYXQgaXNuJ3QgYW4gaXNzdWUgZm9yIHRoZSBzaGFyZWQgYm8gd2UgY291bGQganVzdCB1bnBp
biBpdCBvbiAKPj4gc3VzcGVuZCBhbmQgcGluIGl0IGFnYWluIG9uIHJlc3VtZS4KPj4KPj4gQlRX
OiBXaGF0IGlzIHRoYXQgdXNlZCBmb3IgYW5kIHdoeSBjYW4ndCBpdCBiZSBwYXJ0IG9mIHRoZSBW
Q04gCj4+IGZpcm13YXJlIEJPPwo+Cj4gTG9naWNhbGx5IGl0IGlzIHVzZWQgZm9yIEZXIGFuZCBk
cml2ZXIgc2hhcmluZyBzb21lIHNldHRpbmdzIAo+IGNvbnZlbmllbnRseS4gSWYgeW91IHN1Z2dl
c3QgaXQgY2FuIGJlIGFkZGVkIGludG8gVkNOIEJPLCB0aGVuIGl0IHdpbGwgCj4gc2ltcGx5IHRo
ZSBpbXBsZW1lbnRhdGlvbi4KCkFzIGxvbmcgYXMgdGhpcyBpcyBvbmx5IHVzZWQgYnkgdGhlIGtl
cm5lbCBkcml2ZXIgaXQgc291bmRzIGxpa2UgaXQgaXMgCmJlc3QgcHV0IGludG8gdGhlIFZDTiBC
TyBhcyB3ZWxsLCB5ZXMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gVGhhbmtzIGFuZCBCZXN0
IFJlZ2FyZHMhCj4KPiBKYW1lcyBaaHUKPgo+Pgo+PiBUaGFua3MsCj4+IENocmlzdGlhbi4KPj4K
Pj4+Cj4+PiBCZXN0IFJlZ2FyZHMhCj4+Pgo+Pj4gSmFtZXMKPj4+Cj4+Pj4KPj4+PiBBbGV4Cj4+
Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgWmh1IDxKYW1lcy5aaHVAYW1kLmNvbT4KPj4+
Pj4gLS0tCj4+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyB8
IDI2IAo+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmggfMKgIDEgKwo+Pj4+PiDCoCAyIGZpbGVzIGNo
YW5nZWQsIDI3IGluc2VydGlvbnMoKykKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYyAKPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdmNuLmMKPj4+Pj4gaW5kZXggZDY1M2ExOC4uNTg5MTM5MCAxMDA2
NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5jCj4+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92Y24uYwo+Pj4+PiBA
QCAtMjA1LDYgKzIwNSw3IEBAIGludCBhbWRncHVfdmNuX3N3X2Zpbmkoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgCj4+Pj4+ICphZGV2KQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpZiAoYWRldi0+dmNuLmhhcnZlc3RfY29uZmlnICYgKDEgPDwgaikpCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+Pj4K
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAga3ZmcmVlKGFkZXYtPnZjbi5pbnN0
W2pdLnNhdmVkX3NobV9ibyk7Cj4+Pj4+IGFtZGdwdV9ib19mcmVlX2tlcm5lbCgmYWRldi0+dmNu
Lmluc3Rbal0uZndfc2hhcmVkX2JvLAo+Pj4+PiAmYWRldi0+dmNuLmluc3Rbal0uZndfc2hhcmVk
X2dwdV9hZGRyLAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKHZvaWQgCj4+Pj4+
ICoqKSZhZGV2LT52Y24uaW5zdFtqXS5md19zaGFyZWRfY3B1X2FkZHIpOwo+Pj4+PiBAQCAtMjU0
LDYgKzI1NSwxOCBAQCBpbnQgYW1kZ3B1X3Zjbl9zdXNwZW5kKHN0cnVjdCBhbWRncHVfZGV2aWNl
IAo+Pj4+PiAqYWRldikKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+Pj4+Pgo+Pj4+PiBtZW1jcHlfZnJvbWlvKGFk
ZXYtPnZjbi5pbnN0W2ldLnNhdmVkX2JvLCBwdHIsIHNpemUpOwo+Pj4+PiArCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChhZGV2LT52Y24uaW5zdFtpXS5md19zaGFyZWRf
Ym8gPT0gTlVMTCkKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAwOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNpemUgPSAKPj4+Pj4gYW1kZ3B1X2JvX3NpemUoYWRldi0+dmNuLmluc3RbaV0uZndfc2hh
cmVkX2JvKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHRyID0gYWRldi0+
dmNuLmluc3RbaV0uZndfc2hhcmVkX2NwdV9hZGRyOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGFkZXYtPnZjbi5pbnN0W2ldLnNhdmVkX3NobV9ibyA9IGt2bWFs
bG9jKHNpemUsIAo+Pj4+PiBHRlBfS0VSTkVMKTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgaWYgKCFhZGV2LT52Y24uaW5zdFtpXS5zYXZlZF9zaG1fYm8pCj4+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVOT01FTTsK
Pj4+Pj4gKwo+Pj4+PiArIG1lbWNweV9mcm9taW8oYWRldi0+dmNuLmluc3RbaV0uc2F2ZWRfc2ht
X2JvLCBwdHIsIHNpemUpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gMDsKPj4+Pj4gwqAgfQo+Pj4+PiBAQCAtMjkxLDYgKzMwNCwxOSBAQCBp
bnQgYW1kZ3B1X3Zjbl9yZXN1bWUoc3RydWN0IGFtZGdwdV9kZXZpY2UgCj4+Pj4+ICphZGV2KQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWVt
c2V0X2lvKHB0ciwgMCwgc2l6ZSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIH0KPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYWRl
di0+dmNuLmluc3RbaV0uZndfc2hhcmVkX2JvID09IE5VTEwpCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4+Pj4gKwo+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplID0gCj4+Pj4+IGFtZGdwdV9i
b19zaXplKGFkZXYtPnZjbi5pbnN0W2ldLmZ3X3NoYXJlZF9ibyk7Cj4+Pj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0ciA9IGFkZXYtPnZjbi5pbnN0W2ldLmZ3X3NoYXJlZF9jcHVf
YWRkcjsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYWRl
di0+dmNuLmluc3RbaV0uc2F2ZWRfc2htX2JvICE9IE5VTEwpIHsKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbWNweV90b2lvKHB0ciwgCj4+Pj4+
IGFkZXYtPnZjbi5pbnN0W2ldLnNhdmVkX3NobV9ibywgc2l6ZSk7Cj4+Pj4+ICsga3ZmcmVlKGFk
ZXYtPnZjbi5pbnN0W2ldLnNhdmVkX3NobV9ibyk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGV2LT52Y24uaW5zdFtpXS5zYXZlZF9zaG1fYm8g
PSBOVUxMOwo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGVsc2UKPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1lbXNldF9pbyhw
dHIsIDAsIHNpemUpOwo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsKPj4+Pj4gwqAgfQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oIAo+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92Y24uaAo+Pj4+PiBpbmRleCBmNzM5ZTFhLi5iZDc3ZGFlIDEwMDY0NAo+
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdmNuLmgKPj4+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zjbi5oCj4+Pj4+IEBAIC0x
OTQsNiArMTk0LDcgQEAgc3RydWN0IGFtZGdwdV92Y25faW5zdCB7Cj4+Pj4+IMKgwqDCoMKgwqDC
oMKgwqAgYXRvbWljX3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZHBnX2VuY19zdWJt
aXNzaW9uX2NudDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB2b2lkwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgKmZ3X3NoYXJlZF9jcHVfYWRkcjsKPj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoCB1aW50NjRfdMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmd19zaGFyZWRf
Z3B1X2FkZHI7Cj4+Pj4+ICvCoMKgwqDCoMKgwqAgdm9pZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgICpzYXZlZF9zaG1fYm87Cj4+Pj4+IMKgIH07Cj4+Pj4+Cj4+Pj4+IMKg
IHN0cnVjdCBhbWRncHVfdmNuIHsKPj4+Pj4gLS0gCj4+Pj4+IDIuNy40Cj4+Pj4+Cj4+Pj4+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+IGFtZC1n
ZnggbWFpbGluZyBsaXN0Cj4+Pj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+Pj4+
IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRw
cyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFt
ZC1nZngmYW1wO2RhdGE9MDIlN0MwMSU3Q0phbWVzLlpodSU0MGFtZC5jb20lN0NjZjAwZDhiZTJl
OTk0ZTcxMzgxODA4ZDdkOWY4YTBkNyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNk
JTdDMCU3QzAlN0M2MzcyMTc1MzQxODQ2NDM5MTEmYW1wO3NkYXRhPXBqSXF0V1pLTzU3NjhIbUJP
akgxZmhqWk1QU2N1eUJVZyUyRnByeEgyUVdjNCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Pj4KPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBhbWQt
Z2Z4IG1haWxpbmcgbGlzdAo+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+IGh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1n
ZngmYW1wO2RhdGE9MDIlN0MwMSU3Q0phbWVzLlpodSU0MGFtZC5jb20lN0NjZjAwZDhiZTJlOTk0
ZTcxMzgxODA4ZDdkOWY4YTBkNyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdD
MCU3QzAlN0M2MzcyMTc1MzQxODQ2NDM5MTEmYW1wO3NkYXRhPXBqSXF0V1pLTzU3NjhIbUJPakgx
ZmhqWk1QU2N1eUJVZyUyRnByeEgyUVdjNCUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+Cj4+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1h
aWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAph
bWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngK
