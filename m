Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5606E1C6
	for <lists+amd-gfx@lfdr.de>; Fri, 19 Jul 2019 09:35:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 173E96E5B6;
	Fri, 19 Jul 2019 07:35:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7251F6E5B6
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 07:35:19 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id x1so16208336wrr.9
 for <amd-gfx@lists.freedesktop.org>; Fri, 19 Jul 2019 00:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Leyid0rFuqiuHvdrB+n8XoPx2rHkUcSLjnunvhVkPbU=;
 b=NPucn+iWgJyi4REDL4BXbAevZXGiXhGldZShotMAs8xq6ZjFPEhDH6EMQiqmHgoKh2
 +iBmrbV1r/zppVUk85I6zupn1svWILfo7WfDuzKuK2LetUIyc+8SkH4aaaI7bnf8csXS
 RrV+Gme2EcNPXQnvpiqDqSJFHCMgobjAA+SHPYStSUrisYoT1De2VB+BhZhN5SnbWHQp
 npzq4k0zEgqoT5mUcEQpPoJJqOSmKtkdZVDqjQbTFFzYjejthyBWTl4KHKs9viPugTum
 QUvqjjhCdkl6XPk+1A/X7fcijMcF7qa8RFhbR3zxoNfDFcd9iuEBcoHeP18ks4Dnq/OQ
 +qgw==
X-Gm-Message-State: APjAAAXlQZZdOOmNafT58C6URUEDvf0CjHmTL44fzt5iWD2TZeRQb5Bw
 /fSm6kMn+Eq1AGV3/K6BLW7/GTZJ
X-Google-Smtp-Source: APXvYqynsSwXkrtHV0An0wQ/KbjVG6K6t1eymPeZheKj/SHLYUIQzWRNiFYMzSUOf0Rj8v/yXAb1xg==
X-Received: by 2002:a5d:618d:: with SMTP id j13mr53872684wru.195.1563521718055; 
 Fri, 19 Jul 2019 00:35:18 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k9sm21407523wmi.33.2019.07.19.00.35.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jul 2019 00:35:17 -0700 (PDT)
Subject: Re: [PATCH] Collect all page_base_address bits for pte-further
 addresses (v2)
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190718165317.31371-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <3c1593a7-9b92-2669-1449-c44a676b2796@gmail.com>
Date: Fri, 19 Jul 2019 09:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190718165317.31371-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Leyid0rFuqiuHvdrB+n8XoPx2rHkUcSLjnunvhVkPbU=;
 b=eJQqFJ6n6SB/h26oObDEI+7Wiuxoi/d3/RTwtvRDEQAeaoxyEvPKEbaBnJJU3eRGbX
 4KdZWlFTOEeT9fV1TirJ/K+fqHZax+RGz5/+XDsOWRVsn5NsfvH8LIWeZegAvQnbb4dO
 nq4CNurFKECFssS9adsSCLfFsYjE++IEIp1lGsahotcy1F6zEZ6pXdQGSaJfxC/0PuM7
 j5mobCuqeEZP6dQSxudZytJgNteVtwPD/TjL1n0qCVd557dFQRglPcfpXSJxVFmg/72l
 YBg/FANHLKeh+5XK5iJ4AlDtHF6gJS4hmEpoK8yboROfEMxC1uy1fRVikpE7Da6v7EbP
 BQpA==
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

QW0gMTguMDcuMTkgdW0gMTg6NTMgc2NocmllYiBTdERlbmlzLCBUb206Cj4gVGhlIHNwZWNpZmlj
YXRpb24gc2F5cyB0byB0cmVhdCBhIFBURSB3aXRoIHRoZSBGIGJpdCBzZXQgImxpa2UgYSBQREUi
Cj4gd2hpY2ggbWVhbnMgdGhhdCBhbGwgYnV0IHRoZSBsb3dlciA2IGJpdHMgYXJlIHBhcnQgb2Yg
dGhlIHBhZ2UgYmFzZQo+IGFkZHJlc3MuICBJbmRlZWQsIGluIHRoZSB3aWxkIGEgY29tbWVudCBj
YW1lIGJhY2sgaW5kaWNhdGluZyB0aGF0Cj4gd2Ugd2VyZSBzdHJpcHBpbmcgb2ZmIGJpdHMgbmVl
ZGVkIHRvIHByb3Blcmx5IGZldGNoIHRoZSBuZXh0Cj4gUFRFLgo+Cj4gKHYyKTogT25seSBjYXB0
dXJlIGV4Y2VzcyBiaXRzIGlmIGl0IGlzIGEgUFRFLUZVUlRIRVIgZW50cnkKPgo+IFNpZ25lZC1v
ZmYtYnk6IFRvbSBTdCBEZW5pcyA8dG9tLnN0ZGVuaXNAYW1kLmNvbT4KCkFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cgo+IC0tLQo+ICAgc3JjL2xp
Yi9yZWFkX3ZyYW0uYyB8IDIgKy0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3NyYy9saWIvcmVhZF92cmFtLmMgYi9zcmMv
bGliL3JlYWRfdnJhbS5jCj4gaW5kZXggY2JhOGY2Yi4uZTgzYTg1YyAxMDA2NDQKPiAtLS0gYS9z
cmMvbGliL3JlYWRfdnJhbS5jCj4gKysrIGIvc3JjL2xpYi9yZWFkX3ZyYW0uYwo+IEBAIC02NzYs
NyArNjc2LDcgQEAgcGRlX2lzX3B0ZToKPiAgIAkJCQlwdGVfaWR4ID0gKGFkZHJlc3MgPj4gMTIp
ICYgKCgxVUxMIDw8IHBkZV9maWVsZHMuZnJhZ19zaXplKSAtIDEpOwo+ICAgCj4gICAJCQkJLy8g
Z3JhYiBQVEUgYmFzZSBhZGRyZXNzIGZyb20gdGhlIFBURSB0aGF0IGhhcyB0aGUgRiBiaXQgc2V0
Lgo+IC0JCQkJcGRlX2ZpZWxkcy5wdGVfYmFzZV9hZGRyID0gcHRlX2ZpZWxkcy5wYWdlX2Jhc2Vf
YWRkcjsKPiArCQkJCXBkZV9maWVsZHMucHRlX2Jhc2VfYWRkciA9IHB0ZV9lbnRyeSAmIDB4RkZG
RkZGRkZGRkMwVUxMOwo+ICAgCQkJCWdvdG8gcHRlX2Z1cnRoZXI7Cj4gICAJCQl9Cj4gICAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
