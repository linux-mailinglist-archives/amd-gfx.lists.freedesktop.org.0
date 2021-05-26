Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 923073913E8
	for <lists+amd-gfx@lfdr.de>; Wed, 26 May 2021 11:42:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548286E4F1;
	Wed, 26 May 2021 09:42:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 078E76E4F1
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 09:42:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id p7so366863wru.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 26 May 2021 02:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=O24GEe0un2craiT19rDwgfSZKEK9HG6/i2HmEqT7fkY=;
 b=HiLKx29+X6NJ0FXnyMiSW1UwHSb8KEkqnT+g3HjahBSRBogTiJ7/RhG8URKUUs80NK
 qjEv130P6o7v1oL6gRzgD5kl8x8X9ZKj7i3ow9glVvXf1wuTgFkJZ/Uftj20nL6kE4iN
 i69ddp3dk1RTUy0rekWqrm2pXAfuJpEPXL2majJUj7CtP/QFv/3bziw1Wyn5wEIcr+c/
 D30scPdGT65/4NLS3FePqZsv73sxuB7AURveLgj1vFFmLq/8KmzPtQcpZhAUkS6lLIWn
 dPOMVbb3iClu9+RDPGgzTcbN9jjMJVKLWMDpS17OwJWWAJ6ViCvWnAdqig1KQ/VGBE+0
 Bkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=O24GEe0un2craiT19rDwgfSZKEK9HG6/i2HmEqT7fkY=;
 b=RhkRSsEIc3HBD+WKiCAAMbqvb+q8lr1TQefkYP8p/Jz+VDHzl7PPDew+/Ugd+oUnvU
 ol6TGfjpeQVr+5kzEZiOS6kbOn/vDJZZCze7lVmplxIYkxGGMACYxD2UizJpwNSvnfH9
 72X51vzgxd0brLjFD9xcRf18SZSMABhhw/etqZ7uAKjoYp4PhBJdm1PUq2rZv50vF8O6
 IelsXDNG7spXQokKkwyqTA9+wdsOLRvigYTipnuSn+32IxNs/eLXOYgb6A1tlev4tqaF
 Cd+ZWXr5dBq1et3wF0Gv/MhmemjG2TKsrVE//fdt4Ud5sFZR/vqcPso7M76yAzdfsaC0
 xLlw==
X-Gm-Message-State: AOAM53354Mmq0rW1Y2BDEMeyXIek9UkJ+wQQ+yyUuQHrSmbENA/b+6rA
 lGq4aEavnnOWqx+mibdT/CFaqnSjyOc=
X-Google-Smtp-Source: ABdhPJwe9DncGV3xWoJkliT4YfBhP6tqWOpGWyIUlbsyUOJKfPnZ5cFv+gek6nb/GYL9O6YZ4UPQyw==
X-Received: by 2002:a5d:64a5:: with SMTP id m5mr31722178wrp.182.1622022154741; 
 Wed, 26 May 2021 02:42:34 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7216:94bf:3812:bd88?
 ([2a02:908:1252:fb60:7216:94bf:3812:bd88])
 by smtp.gmail.com with ESMTPSA id v10sm22879674wrq.0.2021.05.26.02.42.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 02:42:34 -0700 (PDT)
Subject: Re: radeon ring 0 test failed on arm64
To: Robin Murphy <robin.murphy@arm.com>, Alex Deucher
 <alexdeucher@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <CAMdYzYptw9L=5SECtVkNZruTT-x57+03vj0A+5efvq8cESzLyQ@mail.gmail.com>
 <CADnq5_NXmRr_Q7JuWZxJAjmavVkvJjNcWayQ1x8LhfcX5CS0uA@mail.gmail.com>
 <CAMdYzYoamh-igvBbKaLSJ6bSc3wA29=8mooJDLMJkj9YQ=wj0A@mail.gmail.com>
 <CADnq5_NXFZPA_z6413FDgr8WRObhCB+HdkHE5P=PAAMV4FiWiA@mail.gmail.com>
 <20dffd4d-fa54-5bc3-c13b-f8ffbf0fb593@arm.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <599edb94-8294-c4c5-ff7f-84c7072af3dd@gmail.com>
Date: Wed, 26 May 2021 11:42:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20dffd4d-fa54-5bc3-c13b-f8ffbf0fb593@arm.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGkgUm9iaW4sCgpBbSAyNS4wNS4yMSB1bSAyMjowOSBzY2hyaWViIFJvYmluIE11cnBoeToKPiBP
biAyMDIxLTA1LTI1IDE0OjA1LCBBbGV4IERldWNoZXIgd3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDI1
LCAyMDIxIGF0IDg6NTYgQU0gUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4gd3JvdGU6
Cj4+Pgo+Pj4gT24gVHVlLCBNYXkgMjUsIDIwMjEgYXQgODo0NyBBTSBBbGV4IERldWNoZXIgPGFs
ZXhkZXVjaGVyQGdtYWlsLmNvbT4gCj4+PiB3cm90ZToKPj4+Pgo+Pj4+IE9uIFR1ZSwgTWF5IDI1
LCAyMDIxIGF0IDg6NDIgQU0gUGV0ZXIgR2VpcyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4gCj4+Pj4g
d3JvdGU6Cj4+Pj4+Cj4+Pj4+IEdvb2QgRXZlbmluZywKPj4+Pj4KPj4+Pj4gSSBhbSBzdHJlc3Mg
dGVzdGluZyB0aGUgcGNpZSBjb250cm9sbGVyIG9uIHRoZSByazM1NjYtcXVhcnR6NjQgCj4+Pj4+
IHByb3RvdHlwZSBTQkMuCj4+Pj4+IFRoaXMgZGV2aWNlIGhhcyAxR0IgYXZhaWxhYmxlIGF0IDww
eDMgMHgwMDAwMDAwMD4gZm9yIHRoZSBQQ0llCj4+Pj4+IGNvbnRyb2xsZXIsIHdoaWNoIG1ha2Vz
IGEgZEdQVSB0aGVvcmV0aWNhbGx5IHBvc3NpYmxlLgo+Pj4+PiBXaGlsZSBhdHRlbXB0aW5nIHRv
IGxpZ2h0IG9mZiBhIEhENzU3MCBjYXJkIEkgbWFuYWdlIHRvIGdldCBhIG1vZGVzZXQKPj4+Pj4g
Y29uc29sZSwgYnV0IHJpbmcwIHRlc3QgZmFpbHMgYW5kIGRpc2FibGVzIGFjY2VsZXJhdGlvbi4K
Pj4+Pj4KPj4+Pj4gTm90ZSwgd2UgZG8gbm90IGhhdmUgVUVGSSwgc28gYWxsIFBDSWUgc2V0dXAg
aXMgZnJvbSB0aGUgTGludXggCj4+Pj4+IGtlcm5lbC4KPj4+Pj4gQW55IGluc2lnaHQgeW91IGNh
biBwcm92aWRlIHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQuCj4+Pj4KPj4+PiBEb2VzIHlvdXIg
cGxhdGZvcm0gc3VwcG9ydCBQQ0llIGNhY2hlIGNvaGVyZW5jeSB3aXRoIHRoZSBDUFU/wqAgSS5l
LiwKPj4+PiBkb2VzIHRoZSBDUFUgYWxsb3cgY2FjaGUgc25vb3BzIGZyb20gUENJZSBkZXZpY2Vz
P8KgIFRoYXQgaXMgcmVxdWlyZWQKPj4+PiBmb3IgdGhlIGRyaXZlciB0byBvcGVyYXRlLgo+Pj4K
Pj4+IEFoLCBtb3N0IGxpa2VseSBub3QuCj4+PiBUaGlzIGlzc3VlIGhhcyBjb21lIHVwIGFscmVh
ZHkgYXMgdGhlIEdJQyBpc24ndCBwZXJtaXR0ZWQgdG8gc25vb3Agb24KPj4+IHRoZSBDUFVzLCBz
byBJIGRvdWJ0IHRoZSBQQ0llIGNvbnRyb2xsZXIgY2FuIGVpdGhlci4KPj4+Cj4+PiBJcyB0aGVy
ZSBubyB3YXkgdG8gd29yayBhcm91bmQgdGhpcyBvciBpcyBpdCBkZWFkIGluIHRoZSB3YXRlcj8K
Pj4KPj4gSXQncyByZXF1aXJlZCBieSB0aGUgcGNpZSBzcGVjLsKgIFlvdSBjb3VsZCBwb3RlbnRp
YWxseSB3b3JrIGFyb3VuZCBpdAo+PiBpZiB5b3UgY2FuIGFsbG9jYXRlIHVuY2FjaGVkIG1lbW9y
eSBmb3IgRE1BLCBidXQgSSBkb24ndCB0aGluayB0aGF0IGlzCj4+IHBvc3NpYmxlIGN1cnJlbnRs
eS7CoCBJZGVhbGx5IHdlJ2QgZmlndXJlIG91dCBzb21lIHdheSB0byBkZXRlY3QgaWYgYQo+PiBw
YXJ0aWN1bGFyIHBsYXRmb3JtIHN1cHBvcnRzIGNhY2hlIHNub29waW5nIG9yIG5vdCBhcyB3ZWxs
Lgo+Cj4gVGhlcmUncyBkZXZpY2VfZ2V0X2RtYV9hdHRyKCksIGFsdGhvdWdoIEkgZG9uJ3QgdGhp
bmsgaXQgd2lsbCB3b3JrIAo+IGN1cnJlbnRseSBmb3IgUENJIGRldmljZXMgd2l0aG91dCBhbiBP
RiBvciBBQ1BJIG5vZGUgLSB3ZSBjb3VsZCAKPiBwZXJoYXBzIGRvIHdpdGggYSBQQ0ktc3BlY2lm
aWMgd3JhcHBlciB3aGljaCBjYW4gd2FsayB1cCBhbmQgZGVmZXIgdG8gCj4gdGhlIGhvc3QgYnJp
ZGdlJ3MgZmlybXdhcmUgZGVzY3JpcHRpb24gYXMgbmVjZXNzYXJ5Lgo+Cj4gVGhlIGNvbW1vbiBE
TUEgb3BzICpkbyogY29ycmVjdGx5IGtlZXAgdHJhY2sgb2YgcGVyLWRldmljZSBjb2hlcmVuY3kg
Cj4gaW50ZXJuYWxseSwgYnV0IGRyaXZlcnMgYXJlbid0IHN1cHBvc2VkIHRvIGJlIHBva2luZyBh
dCB0aGF0IAo+IGluZm9ybWF0aW9uIGRpcmVjdGx5LgoKVGhhdCBzb3VuZHMgbGlrZSB5b3UgdW5k
ZXJlc3RpbWF0ZSB0aGUgcHJvYmxlbS4gQVJNIGhhcyB1bmZvcnR1bmF0ZWx5IAptYWRlIHRoZSBj
b2hlcmVuY3kgZm9yIFBDSSBhbiBvcHRpb25hbCBJUC4KClNvIHdlIGFyZSB0YWxraW5nIGFib3V0
IGEgaGFyZHdhcmUgbGltaXRhdGlvbiB3aGljaCBwb3RlbnRpYWxseSBjYW4ndCBiZSAKZml4ZWQg
d2l0aG91dCByZXBsYWNpbmcgdGhlIGhhcmR3YXJlLgoKQ2hyaXN0aWFuLgoKPgo+IFJvYmluLgo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdm
eCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxp
c3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
