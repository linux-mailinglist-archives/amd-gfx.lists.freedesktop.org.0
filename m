Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1541DED42A
	for <lists+amd-gfx@lfdr.de>; Sun,  3 Nov 2019 19:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175F892C5;
	Sun,  3 Nov 2019 18:24:23 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B04892C5
 for <amd-gfx@lists.freedesktop.org>; Sun,  3 Nov 2019 18:24:21 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a15so14566850wrf.9
 for <amd-gfx@lists.freedesktop.org>; Sun, 03 Nov 2019 10:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2s9mdUFHX1MDxvHnWpOD++7BhhtTKXfLrI3CDYmq198=;
 b=ZKev5XWyCxcAgdwabjGDRQUgIDu5JC7o65SykyXPpuaZ2WKiwUYRhKnY1R3RTFVgbA
 VLsL0L91Z7nw5UzdURhM1pPAdHsQFoHkSDcAgij0peJOL5Y+yMBpjn+4AInTde8j4JLp
 0wep3e/IBz0lyaj80sIs7o/CwzaqPKc1qK+mKiSuMgqcYT1u4335h2S3kKZtHM4AwDCy
 F+FU4MYcxYbCftrKxc81OOcN4gEJ7pHKBAld93xZajqCBXxk+PYsPUiIlwhzcWGPGPUy
 3zjoUEQ7vx+0j/UPd9YsGXtoAKuokTRns0HfTAfLMPvMhITMT5DDVeiaIKrGl48M5to/
 gg/g==
X-Gm-Message-State: APjAAAXT2DmzE41ePYb1O5Ee/FCiMarOwjHBRNA0nZEHarXr1IIseG0b
 5KfkApmazrXr+tcWJ9mNHkpPTn5M
X-Google-Smtp-Source: APXvYqyppKQKu0jAZjDYOvD3T5zV/vfO/QQzsmGhqbAF9j9Ia6puZmmS4Zc8jZClDWFE60vhAwJ4iw==
X-Received: by 2002:a5d:51c3:: with SMTP id n3mr19861670wrv.5.1572805459824;
 Sun, 03 Nov 2019 10:24:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id t134sm17585107wmt.24.2019.11.03.10.24.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 03 Nov 2019 10:24:19 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: implement TMZ accessor
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20191030234233.9896-1-luben.tuikov@amd.com>
 <2723dbff-806b-542f-4ed1-0e9fc807ca15@gmail.com>
 <ad0649b5-44e9-055a-04a1-ca26fc588316@amd.com>
 <CADnq5_PEO=2K=8-CCtvX+KOJstx-g9ba-zkT0TKsXDhH_2H0zQ@mail.gmail.com>
 <29e89f79-6a46-1c3a-a070-0296a7bbb5b4@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b64da3b9-9f20-549d-27f2-18da3ce10ea4@gmail.com>
Date: Sun, 3 Nov 2019 19:24:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <29e89f79-6a46-1c3a-a070-0296a7bbb5b4@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2s9mdUFHX1MDxvHnWpOD++7BhhtTKXfLrI3CDYmq198=;
 b=Mokt26mZHeuI1i4pfQDNr733cwwzchIR0SJHPx8NnMDQbM/WfLwDPaYY0RQ/NHiGKq
 v8TiW4HNk85fv3QD3REAN4R1FuAxL/NtTySVMUZSrcoqHS1VufCJM6HOpxGc+xVOI1WN
 P+fUE1vv3uue9B3PzgZ/Pc/V/fAq9Jq8sYOf9NgN0Bw+aQrWPCy36WSRI88uv+I7onoj
 4ulPPI1c/fOy+Uqbo/j2MEAlVoTBeC1BPU3idrgVdwod1Acc61veqjobfwmNhQqK1dlx
 r4Z88bDGPYGZI0nRa8rr/Io6KZhlczHU8p4QwSftc4Xy+FEkiPo3BZfy66hhAwlfiuu1
 nKaw==
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
Reply-To: christian.koenig@amd.com
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDEuMTEuMTkgdW0gMTk6MjQgc2NocmllYiBUdWlrb3YsIEx1YmVuOgo+IE9uIDIwMTktMTEt
MDEgMTQ6MTQsIEFsZXggRGV1Y2hlciB3cm90ZToKPj4gT24gVGh1LCBPY3QgMzEsIDIwMTkgYXQg
ODoxNSBQTSBUdWlrb3YsIEx1YmVuIDxMdWJlbi5UdWlrb3ZAYW1kLmNvbT4gd3JvdGU6Cj4+PiBP
biAyMDE5LTEwLTMxIDM6MjkgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+PiBBbSAz
MS4xMC4xOSB1bSAwMDo0MyBzY2hyaWViIFR1aWtvdiwgTHViZW46Cj4+Pj4+IEltcGxlbWVudCBh
biBhY2Nlc3NvciBvZiBhZGV2LT50bXouZW5hYmxlZC4gTGV0IG5vdAo+Pj4+PiBjb2RlIGFyb3Vu
ZCBhY2Nlc3MgaXQgYXMgImlmIChhZGV2LT50bXouZW5hYmxlZCkiCj4+Pj4+IGFzIHRoZSBvcmdh
bml6YXRpb24gbWF5IGNoYW5nZS4gSW5zdGVhZC4uLgo+Pj4+Pgo+Pj4+PiBSZWNydWl0ICJib29s
IGFtZGdwdV9pc190bXooYWRldikiIHRvIHJldHVybgo+Pj4+PiBleGFjdGx5IHRoaXMgQm9vbGVh
biB2YWx1ZS4gVGhhdCBpcywgdGhpcyBmdW5jdGlvbgo+Pj4+PiBpcyBub3cgYW4gYWNjZXNzb3Ig
b2YgYW4gYWxyZWFkeSBpbml0aWFsaXplZCBhbmQKPj4+Pj4gc2V0IGFkZXYgYW5kIGFkZXYtPnRt
ei4KPj4+Pj4KPj4+Pj4gQWRkICJ2b2lkIGFtZGdwdV90bXpfc2V0KGFkZXYpIiB0byBjaGVjayBh
bmQgc2V0Cj4+Pj4+IGFkZXYtPnRtei4qIGF0IGluaXRpYWxpemF0aW9uIHRpbWUuIEFmdGVyIHdo
aWNoCj4+Pj4+IG9uZSB1c2VzICJib29sIGFtZGdwdV9pc190bXooYWRldikiIHRvIHF1ZXJ5Cj4+
Pj4+IHdoZXRoZXIgYWRldiBzdXBwb3J0cyBUTVouCj4+Pj4gQWN0dWFsbHkgSSB3b3VsZCByYXRo
ZXIgY29tcGxldGVseSByZW1vdmUgdGhlIGFtZGdwdV90bXouW2hjXSBmaWxlcy4gU2VlCj4+Pj4g
VE1aIGlzIGEgZmVhdHVyZSBhbmQgbm90IGEgaGFyZHdhcmUgYmxvY2suCj4+Pj4KPj4+PiBBbGwg
dGhhdCBzdHVmZiBzaG91bGQgcHJvYmFibHkgbW92ZWQgaW50byB0aGUgUFNQIGhhbmRsaW5nLCBz
aW5jZSB0aGUKPj4+PiBjb250cm9sIG9mIFRNWiBpcyBlbmFibGVkIG9yIGRpc2FibGVkIGluIHRo
ZSBoYXJkd2FyZSBpcyB0aGVyZS4KPj4+IEhpIENocmlzdGlhbiwKPj4+Cj4+PiBUaGFua3MgZm9y
IHJldmlld2luZyB0aGlzLiBTdXJlLCB3ZSBjYW4gZG8gdGhhdCBhcyB3ZWxsLCBzaG91bGQKPj4+
IHRoZXJlIGJlIGNvbnNlbnN1cyBvbiBpdC4KPj4+Cj4+PiBJIGp1c3Qgc2F3IG15c2VsZiBuZWVk
aW5nIHRvIGtub3cgaWYgdGhlIGRldmljZSBpcyBUTVogKGFzIHdlbGwKPj4+IGFzIGlmIGEgYnVm
ZmVyIGlzIFRNWiBmb3Igd2hpY2ggSSB1c2VkIGFtZGdwdV9ib19lbmNyeXB0ZWQoKSkKPj4+IGFu
ZCBzbyBpdCBiZWNhbWUgbmF0dXJhbCB0byB3cml0ZSAoYWZ0ZXIgdGhpcyBwYXRjaCk6Cj4+Pgo+
Pj4gaWYgKCFhbWRncHVfYm9fZW5jcnlwdGVkKGFibykgfHwgIWFtZGdwdV9pc190bXooYWRldikp
IHsKPj4+ICAgICAgICAgIC8qIG5vcm1hbCBwcm9jZXNzaW5nICovCj4+PiB9IGVsc2Ugewo+Pj4g
ICAgICAgICAgLyogVE1aIHByb2Nlc3NpbmcgKi8KPj4+IH0KPj4+Cj4+PiBCVFcsIHNob3VsZCB3
ZSBwcm9jZWVkIGFzIHlvdSBzdWdnZXN0ZWQsIGRvIHlvdSBzZWUKPj4+IHRob3NlIHByaW1pdGl2
ZXMgZ29pbmcgaW50byBwc3BfdjEyXzAuYz8KPj4+Cj4+IFRoZXkgYXJlIG5vdCBwc3AgdmVyc2lv
biBzcGVjaWZpYy4gIHRoZSBQU1AgaGFuZGxlcyB0aGUgc2VjdXJpdHksIGJ1dAo+PiBpdCdzIG5v
dCByZWFsbHkgaW52b2x2ZWQgbXVjaCBmcm9tIGEgZHJpdmVyIHBlcnNwZWN0aXZlOyB0aGV5IGFy
ZQo+PiByZWFsbHkgbW9yZSBvZiBhIG1lbW9yeSBtYW5hZ2VtZW50IHRoaW5nLiAgSSdkIHN1Z2dl
c3QgcHV0dGluZyB0aGVtIGluCj4+IHN0cnVjdCBhbWRncHVfZ21jLgo+IFRoYW5rcyBBbGV4LiBT
byB0aGVuIEknZCBnZXQgcmlkIG9mIHRoZSBmaWxlcyBhbmQgY29uc29saWRhdGUKPiBpbnRvIHN0
cnVjdCBhbWRncHVfZ21jLCB3aXRoIHRoZSBmaWxlcyBkaXNhcHBlYXJpbmcgYXMgQ2hyaXN0aWFu
Cj4gc3VnZ2VzdGVkLgoKU291bmRzIGxpa2UgYSBwbGFuIHRvIG1lIGFzIHdlbGwuCgpUaGFua3Ms
CkNocmlzdGlhbi4KCj4KPiBSZWdhcmRzLAo+IEx1YmVuCj4KPj4gQWxleAo+Pgo+Pj4gUmVnYXJk
cywKPj4+IEx1YmVuCj4+Pgo+Pj4+IFJlZ2FyZHMsCj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Cj4+Pj4+
IEFsc28sIHJlbW92ZSBjaXJjdWxhciBoZWFkZXIgZmlsZSBpbmNsdWRlLgo+Pj4+Pgo+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBMdWJlbiBUdWlrb3YgPGx1YmVuLnR1aWtvdkBhbWQuY29tPgo+Pj4+PiAt
LS0KPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmggICAgICAgIHwg
IDUgKysrKysKPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rldmlj
ZS5jIHwgIDIgKy0KPj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Rt
ei5jICAgIHwgMjMgKysrKysrKysrKystLS0tLS0tLS0tLQo+Pj4+PiAgICBkcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfdG16LmggICAgfCAgNyArKy0tLS0tCj4+Pj4+ICAgIDQgZmls
ZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaCBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+Pj4+IGluZGV4IDdkMWU1MjhjYzc4My4u
MjNiZDgxYTc2NTcwIDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHUuaAo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUu
aAo+Pj4+PiBAQCAtMTI0OSw1ICsxMjQ5LDEwIEBAIF9uYW1lIyNfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+Pj4+ICAgIHN0YXRpYyBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSBwbXVfYXR0
cl8jI19uYW1lID0gX19BVFRSX1JPKF9uYW1lKQo+Pj4+Pgo+Pj4+PiArc3RhdGljIGlubGluZSBi
b29sIGFtZGdwdV9pc190bXooc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+Pj4+ICt7Cj4+
Pj4+ICsgICAgcmV0dXJuIGFkZXYtPnRtei5lbmFibGVkOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+
ICAgICNlbmRpZgo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RldmljZS5jCj4+Pj4+IGluZGV4IDRlZWU0MGI5ZDBiMC4uZjEyYjgxNzQ4MGJiIDEwMDY0NAo+
Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+Pj4+
IEBAIC0xMDU4LDcgKzEwNTgsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZXZpY2VfY2hlY2tfYXJn
dW1lbnRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+Pj4+Pgo+Pj4+PiAgICAgICBhZGV2
LT5maXJtd2FyZS5sb2FkX3R5cGUgPSBhbWRncHVfdWNvZGVfZ2V0X2xvYWRfdHlwZShhZGV2LCBh
bWRncHVfZndfbG9hZF90eXBlKTsKPj4+Pj4KPj4+Pj4gLSAgICBhZGV2LT50bXouZW5hYmxlZCA9
IGFtZGdwdV9pc190bXooYWRldik7Cj4+Pj4+ICsgICAgYW1kZ3B1X3Rtel9zZXQoYWRldik7Cj4+
Pj4+Cj4+Pj4+ICAgICAgIHJldHVybiByZXQ7Cj4+Pj4+ICAgIH0KPj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouYwo+Pj4+PiBpbmRleCA4MjM1MjdhMGZhNDcuLjUxOGI5
ZDMzNTU1MCAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Rtei5jCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
bXouYwo+Pj4+PiBAQCAtMjcsMjYgKzI3LDI1IEBACj4+Pj4+ICAgICNpbmNsdWRlICJhbWRncHUu
aCIKPj4+Pj4gICAgI2luY2x1ZGUgImFtZGdwdV90bXouaCIKPj4+Pj4KPj4+Pj4gLQo+Pj4+PiAg
ICAvKioKPj4+Pj4gLSAqIGFtZGdwdV9pc190bXogLSB2YWxpZGF0ZSB0cnVzdCBtZW1vcnkgem9u
ZQo+Pj4+PiAtICoKPj4+Pj4gKyAqIGFtZGdwdV90bXpfc2V0IC0tIGNoZWNrIGFuZCBzZXQgaWYg
YSBkZXZpY2Ugc3VwcG9ydHMgVE1aCj4+Pj4+ICAgICAqIEBhZGV2OiBhbWRncHVfZGV2aWNlIHBv
aW50ZXIKPj4+Pj4gICAgICoKPj4+Pj4gLSAqIFJldHVybiB0cnVlIGlmIEBkZXYgc3VwcG9ydHMg
dHJ1c3RlZCBtZW1vcnkgem9uZXMgKFRNWiksIGFuZCByZXR1cm4gZmFsc2UgaWYKPj4+Pj4gLSAq
IEBkZXYgZG9lcyBub3Qgc3VwcG9ydCBUTVouCj4+Pj4+ICsgKiBDaGVjayBhbmQgc2V0IGlmIGFu
IHRoZSBkZXZpY2UgQGFkZXYgc3VwcG9ydHMgVHJ1c3RlZCBNZW1vcnkKPj4+Pj4gKyAqIFpvbmVz
IChUTVopLgo+Pj4+PiAgICAgKi8KPj4+Pj4gLWJvb2wgYW1kZ3B1X2lzX3RteihzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKPj4+Pj4gK3ZvaWQgYW1kZ3B1X3Rtel9zZXQoc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYpCj4+Pj4+ICAgIHsKPj4+Pj4gICAgICAgaWYgKCFhbWRncHVfdG16KQo+
Pj4+PiAtICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+PiArICAgICAgICAgICAgcmV0dXJu
Owo+Pj4+Pgo+Pj4+PiAtICAgIGlmIChhZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVOIHx8IGFk
ZXYtPmFzaWNfdHlwZSA9PSBDSElQX0FSQ1RVUlVTKSB7Cj4+Pj4+IC0gICAgICAgICAgICBkZXZf
d2FybihhZGV2LT5kZXYsICJkb2Vzbid0IHN1cHBvcnQgdHJ1c3RlZCBtZW1vcnkgem9uZXMgKFRN
WilcbiIpOwo+Pj4+PiAtICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Pj4+PiArICAgIGlmIChh
ZGV2LT5hc2ljX3R5cGUgPCBDSElQX1JBVkVOIHx8Cj4+Pj4+ICsgICAgICAgIGFkZXYtPmFzaWNf
dHlwZSA9PSBDSElQX0FSQ1RVUlVTKSB7Cj4+Pj4+ICsgICAgICAgICAgICBkZXZfd2FybihhZGV2
LT5kZXYsICJUcnVzdGVkIE1lbW9yeSBab25lIChUTVopIGZlYXR1cmUgbm90IHN1cHBvcnRlZFxu
Iik7Cj4+Pj4+ICsgICAgICAgICAgICByZXR1cm47Cj4+Pj4+ICAgICAgIH0KPj4+Pj4KPj4+Pj4g
LSAgICBkZXZfaW5mbyhhZGV2LT5kZXYsICJUTVogZmVhdHVyZSBpcyBlbmFibGVkXG4iKTsKPj4+
Pj4gKyAgICBhZGV2LT50bXouZW5hYmxlZCA9IHRydWU7Cj4+Pj4+Cj4+Pj4+IC0gICAgcmV0dXJu
IHRydWU7Cj4+Pj4+ICsgICAgZGV2X2luZm8oYWRldi0+ZGV2LCAiVHJ1c3RlZCBNZW1vcnkgWm9u
ZSAoVE1aKSBmZWF0dXJlIHN1cHBvcnRlZCBhbmQgZW5hYmxlZFxuIik7Cj4+Pj4+ICAgIH0KPj4+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaCBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90bXouaAo+Pj4+PiBpbmRleCAyOGUw
NTE3N2ZiODkuLmFkM2FkOGMwMTFmOSAxMDA2NDQKPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3Rtei5oCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90bXouaAo+Pj4+PiBAQCAtMjQsMTYgKzI0LDEzIEBACj4+Pj4+ICAgICNp
Zm5kZWYgX19BTURHUFVfVE1aX0hfXwo+Pj4+PiAgICAjZGVmaW5lIF9fQU1ER1BVX1RNWl9IX18K
Pj4+Pj4KPj4+Pj4gLSNpbmNsdWRlICJhbWRncHUuaCIKPj4+Pj4gLQo+Pj4+PiAgICAvKgo+Pj4+
PiAtICogVHJ1c3QgbWVtb3J5IHpvbmUgc3R1ZmYKPj4+Pj4gKyAqIFRydXN0ZWQgTWVtb3J5IFpv
bmUgcGFydGljdWxhcnMKPj4+Pj4gICAgICovCj4+Pj4+ICAgIHN0cnVjdCBhbWRncHVfdG16IHsK
Pj4+Pj4gICAgICAgYm9vbCAgICBlbmFibGVkOwo+Pj4+PiAgICB9Owo+Pj4+Pgo+Pj4+PiAtCj4+
Pj4+IC1leHRlcm4gYm9vbCBhbWRncHVfaXNfdG16KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
KTsKPj4+Pj4gK2V4dGVybiB2b2lkIGFtZGdwdV90bXpfc2V0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKPj4+Pj4KPj4+Pj4gICAgI2VuZGlmCj4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
