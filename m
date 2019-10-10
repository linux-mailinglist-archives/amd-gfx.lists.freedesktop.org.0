Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C84D1E7C
	for <lists+amd-gfx@lfdr.de>; Thu, 10 Oct 2019 04:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2999C6EA83;
	Thu, 10 Oct 2019 02:33:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A176EA83
 for <amd-gfx@lists.freedesktop.org>; Thu, 10 Oct 2019 02:33:34 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o18so5668075wrv.13
 for <amd-gfx@lists.freedesktop.org>; Wed, 09 Oct 2019 19:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E1PGYt0pZsLiSQSOJ4lhrWb5PuFpCKAbhdc0nGI9bAc=;
 b=pmj++eTAIBesMlZQOZQ6cV8sxrR8lolej9fdpMjgBETNOLBoUBK9Oi1B6jpDDQfIFC
 62DcOM0IUZCr3sfyDVQJUVWEawhp5Oa2i8s9yCPU8tWrlW74rsInCJEwKIZ6vuZN2xFp
 twUiRmP98kePH8d/+OrJ3v0b+GdXRcXBJRJ1TAjlzZrQtcORi6E6KtDinXr04eXmFkmN
 CwOkPW4GOdaDmywW2rADLLHE6Vp7FiwohyYWaU51jDKiuC+SspZqjBww6Jf/nB/V2E1z
 z4HEY0OOTs3LPSv+ZiM2dd3WkxvWF4juZZSTYpFAjlhG6i9Js1jwWLGSW8IMw5/WSJOr
 gucw==
X-Gm-Message-State: APjAAAWGCmBzZ8gvyDV2Xfe+5ipTGO1NHWKIA4HHUXYT5BFgIrM0bske
 SlbLJO9f07jPRq9W6kr4ffh8aclxBYBOnVNXmYYkGg==
X-Google-Smtp-Source: APXvYqzLrSZsVAszEdcY5olX9rcvqOqdAeDhxcVat4Ezz0wq//pob+tLaeTbabbWxfF7wg7P2lKKt9c1Lz1FFc4iUPI=
X-Received: by 2002:adf:ee8a:: with SMTP id b10mr5630413wro.40.1570674813337; 
 Wed, 09 Oct 2019 19:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191009110757.30995-1-xiaojie.yuan@amd.com>
 <BN8PR12MB3602BB4F482647F07C325E3A89940@BN8PR12MB3602.namprd12.prod.outlook.com>
In-Reply-To: <BN8PR12MB3602BB4F482647F07C325E3A89940@BN8PR12MB3602.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 9 Oct 2019 22:33:19 -0400
Message-ID: <CADnq5_MQSOscW5N2TX1jXgWGt4fyoA6-A8QPWreyEOroT_AR6Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/amd/powerplay: add more feature bits
To: "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=E1PGYt0pZsLiSQSOJ4lhrWb5PuFpCKAbhdc0nGI9bAc=;
 b=WaSCnrkJRxAOW8oDkw5HzcwBsoEMGn0VVMz582F7TqojRIsWtWNfwMQNQmOerMPmoW
 1Bx24N368F4F9cCP6kmdJ50yhmTo678AmFWJV21l8lkI4PbVLtTP3lHB/EH7jBBoXapD
 pHIv8qI49EO6qn2U03M1C3cjScQzBf/t+L7WydQ4z3p++8OmYollvkhStB3jm19EHfdS
 DmcGc93hKIbuajIX8n4UPPSLCmfdqaU3s0YzDIZm62/iibwgBMqIc29AyuqQF2+ctpl3
 IeGpLe1JbQ7LDSOd9t1Ncc5ktF40qqC1gWKi1LnCof+AXlQhigTD7PUx/lRPyD/oBwA4
 qqJw==
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
Cc: "Xiao, Jack" <Jack.Xiao@amd.com>, "Wang,
 Kevin\(Yang\)" <Kevin1.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KCk9uIFdl
ZCwgT2N0IDksIDIwMTkgYXQgMTA6MjUgUE0gWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFt
ZC5jb20+IHdyb3RlOgo+Cj4gUGluZyAuLi4KPgo+IEJSLAo+IFhpYW9qaWUKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IEZyb206IFl1YW4sIFhpYW9qaWUgPFhpYW9qaWUuWXVh
bkBhbWQuY29tPgo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0b2JlciA5LCAyMDE5IDc6MDggUE0KPiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgPGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnPgo+IENjOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgWGlh
bywgSmFjayA8SmFjay5YaWFvQGFtZC5jb20+OyBGZW5nLCBLZW5uZXRoIDxLZW5uZXRoLkZlbmdA
YW1kLmNvbT47IFF1YW4sIEV2YW4gPEV2YW4uUXVhbkBhbWQuY29tPjsgV2FuZywgS2V2aW4oWWFu
ZykgPEtldmluMS5XYW5nQGFtZC5jb20+OyBZdWFuLCBYaWFvamllIDxYaWFvamllLll1YW5AYW1k
LmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0ggMS8yXSBkcm0vYW1kL3Bvd2VycGxheTogYWRkIG1vcmUg
ZmVhdHVyZSBiaXRzCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFvamllIFl1YW4gPHhpYW9qaWUueXVh
bkBhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBf
cHB0LmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9u
YXZpMTBfcHB0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMK
PiBpbmRleCA1YTM0ZDAxZjdmN2MuLjQ0MTUyYzFmMDFjNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9uYXZpMTBfcHB0LmMKPiBAQCAtMzM3LDE5ICszMzcsMjIgQEAgbmF2
aTEwX2dldF9hbGxvd2VkX2ZlYXR1cmVfbWFzayhzdHJ1Y3Qgc211X2NvbnRleHQgKnNtdSwKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX1BQ
VF9CSVQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBGRUFUVVJFX01BU0so
RkVBVFVSRV9URENfQklUKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRkVB
VFVSRV9NQVNLKEZFQVRVUkVfR0ZYX0VEQ19CSVQpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0FQQ0NfUExVU19CSVQpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCBGRUFUVVJFX01BU0soRkVBVFVSRV9WUjBIT1RfQklU
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRkVBVFVSRV9NQVNLKEZFQVRV
UkVfRkFOX0NPTlRST0xfQklUKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwg
RkVBVFVSRV9NQVNLKEZFQVRVUkVfVEhFUk1BTF9CSVQpCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCBGRUFUVVJFX01BU0soRkVBVFVSRV9MRURfRElTUExBWV9CSVQpCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EUE1f
RENFRkNMS19CSVQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCBGRUFUVVJF
X01BU0soRkVBVFVSRV9EU19HRlhDTEtfQklUKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCBGRUFUVVJFX01BU0soRkVBVFVSRV9EU19MQ0xLX0JJVCkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0RTX0RDRUZDTEtfQklU
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRkVBVFVSRV9NQVNLKEZFQVRV
UkVfRldfRFNUQVRFX0JJVCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8IEZF
QVRVUkVfTUFTSyhGRUFUVVJFX0JBQ09fQklUKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfQUNEQ19CSVQpCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCBGRUFUVVJFX01BU0soRkVBVFVSRV9HRlhfU1NfQklUKQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRkVBVFVSRV9NQVNLKEZFQVRVUkVfQVBD
Q19ERkxMX0JJVCkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgRkVBVFVSRV9N
QVNLKEZFQVRVUkVfRldfQ1RGX0JJVCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX0ZXX0NURl9CSVQpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IEZFQVRVUkVfTUFTSyhGRUFUVVJFX09VVF9PRl9CQU5EX01PTklUT1Jf
QklUKTsKPgo+ICAgICAgICAgIGlmIChhZGV2LT5wbS5wcF9mZWF0dXJlICYgUFBfTUNMS19EUE1f
TUFTSykKPiAgICAgICAgICAgICAgICAgICoodWludDY0X3QgKilmZWF0dXJlX21hc2sgfD0gRkVB
VFVSRV9NQVNLKEZFQVRVUkVfRFBNX1VDTEtfQklUKQo+IC0tCj4gMi4yMC4xCj4KPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9hbWQtZ2Z4
