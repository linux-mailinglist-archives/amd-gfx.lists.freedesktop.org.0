Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A64286445
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 16:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D175C6E83F;
	Thu,  8 Aug 2019 14:24:49 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F906E83F
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 14:24:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l2so2649338wmg.0
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 07:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=YYvLEbg7oKomK6xUTN6W7n1CefSHtziLxS0WGBzTNQs=;
 b=NT/5YF9xcgHLIh3Y3ECNTMwLDFzUgkGFZqCs7ORoZIz9ycW/AfxzFl7JcF9zg0pTeG
 Q2lujDr3x6BXinaBql5/TZsJkQuE+FCb0THUWH6Tef5Zufk8h6SdQICeyZP6V2Y3aa6z
 t87cAwqZxpltLuH3MUPxeaIH29sT0uFEZks6+d+Bc7y9AmYcLxjjZsQ4PMihmLPb0h7k
 AzEaVmhCDJPMdrcJJFdpikygRXihMtTlsG6EbsxOOICKCCPsNwXeu1DWMMPMVDG8TvNg
 jmaT203FFbq0i1h2TLzXkZx97+XP/spEo566AYn3DYyuY55V5ru8CHCAacVxoGYvPOcK
 jqDg==
X-Gm-Message-State: APjAAAWvostpuwnWKo23mhr81hPQSwGOciti0uXWCJFbw1gNARujuMtk
 aNoWG7rRp0RyofaNVgbb9oRGSDel
X-Google-Smtp-Source: APXvYqz40IAhXMzOlEUidm2D2tpEMeAtU3Ly+ws/qP3/uBo9WofFgERuejDmbB0uoShBTOQ1vT6SqQ==
X-Received: by 2002:a1c:3cc4:: with SMTP id j187mr4554017wma.36.1565274286743; 
 Thu, 08 Aug 2019 07:24:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x20sm208929782wrg.10.2019.08.08.07.24.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:24:46 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: update ras sysfs feature info
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Russell, Kent" <Kent.Russell@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris"
 <Chris.Freehill@amd.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
 <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <eeb641a8-2336-e177-cb8b-bcf6c21acdef@gmail.com>
Date: Thu, 8 Aug 2019 16:24:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB141855615C68E69C503AC4B7FCD70@DM5PR12MB1418.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=YYvLEbg7oKomK6xUTN6W7n1CefSHtziLxS0WGBzTNQs=;
 b=rPO7NbUSOCY+qreMxt+P8oBbw5PzaGmFpUptjFAiFl0Kh6SvclPn/mfzcWiZCLb3cr
 DqsCRjy0sbcMS3S6nwtWai/VkPDtf9fotwysmBSVRJ8Gj1/O1s0OKycsAB/o+nGK+cXT
 tr7IBr1ptWB4UYzek2H6dZZWaCJwJiW5fih3YO68TKZzZ18T5ofptUgTvc2G4G7pUeg4
 ST3cjEZysgmpGYaLbsafIfIedQiEgj0kCa3anl1HBT6LEiIA2pfS1V6XXueW1robE41+
 um38Sd220U+0N5pHBDvoNXpzB6SAoKgaVmL64HcRp0GyhHw12awSltGg0Sc9z0rdnx7p
 0nTA==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgSGF3a2luZywKCmxvb2tzIGxpa2UgeW91IHNraXBwZWQgbXkgcmVzcG9uc2UuCgpFdmVuIHRo
ZSBjdXJyZW50IHdheSBob3cgc3lzZnMgaXMgdXNlZCBpbiB0aGUgcmFzIGNvZGUgaXMgYSBjbGVh
ciBOTy1HTyAKYW5kIHNob3VsZCBiZSBmaXhlZCBiZWZvcmUgdGhpcyBpcyBwdXNoZWQgdXBzdHJl
YW0uCgpBIHN5c2ZzIGVudHJ5IHNob3VsZCBzZXJpb3VzbHkgTk9UIHJldHVybiBhIG11bHRpIGxp
bmUgdmFsdWUgd2hpY2ggbmVlZHMgCnRvIGJlIGV4dGVuc2l2ZWx5IHBhcnNlZCBieSB0aGUgYXBw
bGljYXRpb24uCgpSZWdhcmRzLApDaHJpc3RpYW4uCgpBbSAwOC4wOC4xOSB1bSAxNTo1MCBzY2hy
aWViIFpoYW5nLCBIYXdraW5nOgo+IFVuZGVyc3Rvb2QgYW5kIGFncmVlIHdlIHNob3VsZCBrZWVw
IHN0YWJsZSBpbnRlcmZhY2VzLgo+Cj4gQnV0IHRoZSBpbmZvcm1hdGlvbiBpbiBmZWF0dXJlIG5v
ZGUgaXMgbm90IGNvcnJlY3QgYW5kIG1ha2VzIHBlb3BsZSBjb25mdXNpbmcuIEJhc2ljYWxseSwg
ZWFjaCBJUCBibG9ja3MgY2FuIHN1cHBvcnQgYWxsIHRoZSBmb3VyIGVycm9yIHR5cGVzLCBub3Qg
anVzdCBtdWx0aS11bmNvcnJlY3RhYmxlLiBBcyBhIHJlc3VsdCwgYW55IHVwcGVyIGxldmVsIGFw
cHMvbGlicyB0aGF0IHJlYWQgZnJvbSB0aGlzIGZpbGUgd2lsbCBqdXN0IGdldCBjb25mdXNpbmcg
aW5mb3JtYXRpb24gYXMgd2VsbC4gVGhlIGZlYXR1cmUgbWFzayBpcyBhbHJlYWR5IGdvb2QgZW5v
dWdoIGZvciB0aGlzIG5vZGUuCj4KPiBSZWdhcmRzLAo+IEhhd2tpbmcKPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+IEZyb206IFJ1c3NlbGwsIEtlbnQgPEtlbnQuUnVzc2VsbEBhbWQuY29t
Pgo+IFNlbnQ6IDIwMTnlubQ45pyIOOaXpSAyMDo1MQo+IFRvOiBaaGFuZywgSGF3a2luZyA8SGF3
a2luZy5aaGFuZ0BhbWQuY29tPjsgWmhvdTEsIFRhbyA8VGFvLlpob3UxQGFtZC5jb20+OyBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgUGFuLCBYaW5odWkgPFhpbmh1aS5QYW5AYW1kLmNv
bT47IEZyZWVoaWxsLCBDaHJpcyA8Q2hyaXMuRnJlZWhpbGxAYW1kLmNvbT4KPiBDYzogWmhvdTEs
IFRhbyA8VGFvLlpob3UxQGFtZC5jb20+Cj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJtL2FtZGdw
dTogdXBkYXRlIHJhcyBzeXNmcyBmZWF0dXJlIGluZm8KPgo+ICtDaHJpcyBGcmVlaGlsbAo+Cj4g
V2hpbGUgSSBjYW4gdW5kZXJzdGFuZCB0aGlzIGNoYW5nZSwgdGhpcyBicm9rZSBvdXIgU01JIGlu
dGVyZmFjZSwgd2hpY2ggd2FzIGV4cGVjdGluZyBhIHNwZWNpZmljIHN0cmluZyBmb3JtYXQgZm9y
IHRoZSByYXMvZmVhdHVyZXMgZmlsZS4gVGhpcyBoYXMgaGFwcGVuZWQgYSBmZXcgdGltZXMgbm93
LCB3aGVyZSBjaGFuZ2VzIHRvIHRoZSBSQVMgc3lzZnMgZmlsZXMgaGFzIGJyb2tlIHRoZSBTTUkg
Q0xJIGFuZC9vciBTTUkgTElCLiBDYW4gd2UgcGxlYXNlIGdldCBhIHN0YWJsZSBpbnRlcmZhY2Ug
YW5kIHN5c2ZzIGZvcm1hdCBzZXQgdXAgYmVmb3JlIHB1Ymxpc2hpbmcgcGF0Y2hlcz8gVGhpcyBp
cyBjcmVhdGluZyBhIGxvdCBvZiBleHRyYSB3b3JrIGZvciBkZXZlbG9wZXJzIHdpdGggdGhlIFNN
SSB0byBjb25zdGFudGx5IGtlZXAgdXAgd2l0aCB0aGUgY2hhbmdlcyBiZWluZyBtYWRlIHRvIHN5
c2ZzIGZpbGVzLiBUaGFuayB5b3UuCj4KPiAgIEtlbnQKPgo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nCj4gU2VudDogTW9uZGF5LCBBdWd1c3Qg
NSwgMjAxOSA0OjE1IEFNCj4gVG86IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPjsgYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5j
b20+Cj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPgo+IFN1YmplY3Q6IFJFOiBb
UEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvCj4KPiBSZXZp
ZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+Cj4gUmVnYXJk
cywKPiBIYXdraW5nCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQtZ2Z4
IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgVGFv
IFpob3UKPiBTZW50OiAyMDE55bm0OOaciDXml6UgMTY6MDQKPiBUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5jb20+OyBaaGFuZywg
SGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IENjOiBaaG91MSwgVGFvIDxUYW8uWmhv
dTFAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lz
ZnMgZmVhdHVyZSBpbmZvCj4KPiByZW1vdmUgY29uZnVzZWQgcmFzIGVycm9yIHR5cGUgaW5mbwo+
Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29tPgo+IC0tLQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcgKysrKystLS0tLS0t
LS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEyIGRlbGV0aW9ucygt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IGluZGV4IGQyZThh
ODVmNmUzOC4uMzY5NjUxMjQ3YjIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9yYXMuYwo+IEBAIC03ODcsMjUgKzc4NywxOCBAQCBzdGF0aWMgc3NpemVfdCBhbWRncHVf
cmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LAo+ICAgCXN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7Cj4gICAJc3RydWN0IHJhc19j
b21tb25faWYgaGVhZDsKPiAgIAlpbnQgcmFzX2Jsb2NrX2NvdW50ID0gQU1ER1BVX1JBU19CTE9D
S19DT1VOVDsKPiAtCWludCBpOwo+ICsJaW50IGksIGVuYWJsZWQ7Cj4gICAJc3NpemVfdCBzOwo+
IC0Jc3RydWN0IHJhc19tYW5hZ2VyICpvYmo7Cj4gICAKPiAgIAlzID0gc2NucHJpbnRmKGJ1Ziwg
UEFHRV9TSVpFLCAiZmVhdHVyZSBtYXNrOiAweCV4XG4iLCBjb24tPmZlYXR1cmVzKTsKPiAgIAo+
ICAgCWZvciAoaSA9IDA7IGkgPCByYXNfYmxvY2tfY291bnQ7IGkrKykgewo+ICAgCQloZWFkLmJs
b2NrID0gaTsKPiArCQllbmFibGVkID0gYW1kZ3B1X3Jhc19pc19mZWF0dXJlX2VuYWJsZWQoYWRl
diwgJmhlYWQpOwo+ICAgCj4gLQkJaWYgKGFtZGdwdV9yYXNfaXNfZmVhdHVyZV9lbmFibGVkKGFk
ZXYsICZoZWFkKSkgewo+IC0JCQlvYmogPSBhbWRncHVfcmFzX2ZpbmRfb2JqKGFkZXYsICZoZWFk
KTsKPiAtCQkJcyArPSBzY25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywKPiAtCQkJCQki
JXM6ICVzXG4iLAo+IC0JCQkJCXJhc19ibG9ja19zdHIoaSksCj4gLQkJCQkJcmFzX2Vycl9zdHIo
b2JqLT5oZWFkLnR5cGUpKTsKPiAtCQl9IGVsc2UKPiAtCQkJcyArPSBzY25wcmludGYoJmJ1Zltz
XSwgUEFHRV9TSVpFIC0gcywKPiAtCQkJCQkiJXM6IGRpc2FibGVkXG4iLAo+IC0JCQkJCXJhc19i
bG9ja19zdHIoaSkpOwo+ICsJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBBR0VfU0laRSAtIHMs
Cj4gKwkJCQkiJXMgcmFzIGZlYXR1cmUgbWFzazogJXNcbiIsCj4gKwkJCQlyYXNfYmxvY2tfc3Ry
KGkpLCBlbmFibGVkPyJvbiI6Im9mZiIpOwo+ICAgCX0KPiAgIAo+ICAgCXJldHVybiBzOwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
