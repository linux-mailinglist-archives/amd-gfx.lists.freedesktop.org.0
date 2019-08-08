Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA028628B
	for <lists+amd-gfx@lfdr.de>; Thu,  8 Aug 2019 15:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091F06E586;
	Thu,  8 Aug 2019 13:03:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A206E586
 for <amd-gfx@lists.freedesktop.org>; Thu,  8 Aug 2019 13:03:34 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id s15so2347487wmj.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 08 Aug 2019 06:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=/GV40+Bjg5VnZmq8wWZT6fhe/TVznpbpEBnmCz9wrt4=;
 b=E9YYoqSlIVyGL0Kt6Sd9wBAjDG50SMOSmWCrdwyfsFx9pwSvD9OVBg9fmlpMulfbfG
 lnlNfjfqeW8LO9SZrl7WjVfOaNJq4W+dF+TdUJ6mJOdYAxjG8eUKXBH6KM5yOgN3tdl9
 LX+UAT47IQB2AbgC5qIqTYeifqccPAocb4bMR8oFWrpxsvmNnSURlsJLg3Q/zYH2uHKD
 qELw1DDwtWI+05ce7XEzzDfKwavGgrTffZugEtJzB335GgNunxm+yb8aApCy98P1pjpi
 lyu1bRQZEh4BaEDdIeI04Tg3v0GsjSq1howobgVuAHATNWCIDJBzwwnIZh2B8SVO5KJg
 Wrhg==
X-Gm-Message-State: APjAAAXgCjGxHIbcpa8y4AYEfaUlWXK7H5n8fIdgHs44TrEIAXU+922f
 ojNnIrIz0w5nuq7UW8R95J85IF5g
X-Google-Smtp-Source: APXvYqwrkXfxyQ3wN9v8olunr204Mp14EEa2P8gab3BqVf3QGZfMBLWLtgeqDCfGtuA14HaGP3ngYg==
X-Received: by 2002:a1c:7611:: with SMTP id r17mr4364502wmc.117.1565269413335; 
 Thu, 08 Aug 2019 06:03:33 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f10sm82863566wrs.22.2019.08.08.06.03.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 06:03:32 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: update ras sysfs feature info
To: "Russell, Kent" <Kent.Russell@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>, "Zhou1, Tao" <Tao.Zhou1@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Freehill, Chris"
 <Chris.Freehill@amd.com>
References: <20190805080408.20770-1-tao.zhou1@amd.com>
 <DM5PR12MB14183A68E61B70184BEC459FFCDA0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d2308dcf-e0d4-4463-425a-1f8397328fb0@gmail.com>
Date: Thu, 8 Aug 2019 15:03:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <BN6PR12MB16188930BC2E19E50B0EDB9185D70@BN6PR12MB1618.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/GV40+Bjg5VnZmq8wWZT6fhe/TVznpbpEBnmCz9wrt4=;
 b=CnC7LIGDZob+kHmTNTc/LrQ6F9ilpEfltHvJBIry8enrfLocmsfvi9Yw5q0RcuNxWB
 Vf3vCmIVXEPLJPLbKE7PkdhhS1ZHDx7B67ijdSAMvUMyO31ECFxKVNVjZxACA5zrV7rS
 p5VRfMD34B0T1GKIcJlIZ1mbfo6oxb4jW4OJeE20qETQwrxxAMSOoWnwdJbpBglilhWM
 b1v+F0ngkq0LHECepJQsrHFZbrayOO55ogrWhUc8rIduSSKDXrmeR0Cyu/iudRBoV5MX
 aB+LpLyneT16Dq67yyBIiHYyPmgWEoMOVqzzwbxI4YcDHhWVxukIEfasfy0QnC4aBY/H
 2vkQ==
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

SGkgVGFvLAoKeWVhaCBLZW50IGlzIGFic29sdXRlbHkgcmlnaHQuIEEgbXVzdCBoYXZlIHJlcXVp
cmVtZW50IGZvciBzeXNmcyBpcyBhIApzdGFibGUgaW50ZXJmYWNlLgoKQnV0IHRoZXJlIGFyZSBh
IGNvdXBsZSBvZiBvdGhlciB2aW9sYXRpb25zIGZvciBzeXNmcyBydWxlcyBhcyB3ZWxsOgo+ICAg
CXMgPSBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICJmZWF0dXJlIG1hc2s6IDB4JXhcbiIsIGNv
bi0+ZmVhdHVyZXMpOwo+ICAgCj4gICAJZm9yIChpID0gMDsgaSA8IHJhc19ibG9ja19jb3VudDsg
aSsrKSB7CkEgbXVzdCBoYXZlIGZvciBzeXNmcyBpcyBvbmUgdmFsdWUgcGVyIGZpbGUuIFNvIHBy
aW50aW5nIGEgZmVhdHVyZSBtYXNrIAphbmQgdGhlbiBtdWx0aXBsZSBmZWF0dXJlIHZhbHVlcyBp
cyBub3QgcmVhbGx5IGNvcnJlY3QuCgpBZGRpdGlvbmFsIHRvIHRoYXQgc3lzZnMgaXMgZGVzaWdu
IGZvciB0b29sIGludGVyZmFjaW5nLCBub3QgZm9yIHVzZXIgCmludGVyZmFjaW5nLiBTbyBwcmlu
dGluZyB0ZXh0IGxpa2UgImZlYXR1cmUgeHkgaXMgZW5hYmxlZC9kaXNhYmxlIiBpcyAKbm90IHZl
cnkgY29udmVuaWVudCBlaXRoZXIuCgpXaGF0IHlvdSBzaG91bGQgZG8gaXMgdG8gY3JlYXRlIGZp
bGVzIGxpa2UgYW1kZ3B1X3Jhc19mZWF0dXJlX3h5IGFuZCAKdGhlbiByZXR1cm4gMC8xIGJhc2Vk
IG9uIGlmIHRoZSBmZWF0dXJlIGlzIGVuYWJsZWQgb3Igbm90LgoKUmVnYXJkcywKQ2hyaXN0aWFu
LgoKQW0gMDguMDguMTkgdW0gMTQ6NTEgc2NocmllYiBSdXNzZWxsLCBLZW50Ogo+ICtDaHJpcyBG
cmVlaGlsbAo+Cj4gV2hpbGUgSSBjYW4gdW5kZXJzdGFuZCB0aGlzIGNoYW5nZSwgdGhpcyBicm9r
ZSBvdXIgU01JIGludGVyZmFjZSwgd2hpY2ggd2FzIGV4cGVjdGluZyBhIHNwZWNpZmljIHN0cmlu
ZyBmb3JtYXQgZm9yIHRoZSByYXMvZmVhdHVyZXMgZmlsZS4gVGhpcyBoYXMgaGFwcGVuZWQgYSBm
ZXcgdGltZXMgbm93LCB3aGVyZSBjaGFuZ2VzIHRvIHRoZSBSQVMgc3lzZnMgZmlsZXMgaGFzIGJy
b2tlIHRoZSBTTUkgQ0xJIGFuZC9vciBTTUkgTElCLiBDYW4gd2UgcGxlYXNlIGdldCBhIHN0YWJs
ZSBpbnRlcmZhY2UgYW5kIHN5c2ZzIGZvcm1hdCBzZXQgdXAgYmVmb3JlIHB1Ymxpc2hpbmcgcGF0
Y2hlcz8gVGhpcyBpcyBjcmVhdGluZyBhIGxvdCBvZiBleHRyYSB3b3JrIGZvciBkZXZlbG9wZXJz
IHdpdGggdGhlIFNNSSB0byBjb25zdGFudGx5IGtlZXAgdXAgd2l0aCB0aGUgY2hhbmdlcyBiZWlu
ZyBtYWRlIHRvIHN5c2ZzIGZpbGVzLiBUaGFuayB5b3UuCj4KPiAgIEtlbnQKPgo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpoYW5nLCBIYXdraW5nCj4gU2VudDogTW9u
ZGF5LCBBdWd1c3QgNSwgMjAxOSA0OjE1IEFNCj4gVG86IFpob3UxLCBUYW8gPFRhby5aaG91MUBh
bWQuY29tPjsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5o
dWkuUGFuQGFtZC5jb20+Cj4gQ2M6IFpob3UxLCBUYW8gPFRhby5aaG91MUBhbWQuY29tPgo+IFN1
YmplY3Q6IFJFOiBbUEFUQ0hdIGRybS9hbWRncHU6IHVwZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBp
bmZvCj4KPiBSZXZpZXdlZC1ieTogSGF3a2luZyBaaGFuZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29t
Pgo+Cj4gUmVnYXJkcywKPiBIYXdraW5nCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBG
cm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBC
ZWhhbGYgT2YgVGFvIFpob3UKPiBTZW50OiAyMDE55bm0OOaciDXml6UgMTY6MDQKPiBUbzogYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IFBhbiwgWGluaHVpIDxYaW5odWkuUGFuQGFtZC5j
b20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+IENjOiBaaG91MSwg
VGFvIDxUYW8uWmhvdTFAYW1kLmNvbT4KPiBTdWJqZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IHVw
ZGF0ZSByYXMgc3lzZnMgZmVhdHVyZSBpbmZvCj4KPiByZW1vdmUgY29uZnVzZWQgcmFzIGVycm9y
IHR5cGUgaW5mbwo+Cj4gU2lnbmVkLW9mZi1ieTogVGFvIFpob3UgPHRhby56aG91MUBhbWQuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwgMTcg
KysrKystLS0tLS0tLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9yYXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+
IGluZGV4IGQyZThhODVmNmUzOC4uMzY5NjUxMjQ3YjIzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+IEBAIC03ODcsMjUgKzc4NywxOCBAQCBzdGF0aWMgc3Np
emVfdCBhbWRncHVfcmFzX3N5c2ZzX2ZlYXR1cmVzX3JlYWQoc3RydWN0IGRldmljZSAqZGV2LAo+
ICAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZGRldi0+ZGV2X3ByaXZhdGU7Cj4gICAJ
c3RydWN0IHJhc19jb21tb25faWYgaGVhZDsKPiAgIAlpbnQgcmFzX2Jsb2NrX2NvdW50ID0gQU1E
R1BVX1JBU19CTE9DS19DT1VOVDsKPiAtCWludCBpOwo+ICsJaW50IGksIGVuYWJsZWQ7Cj4gICAJ
c3NpemVfdCBzOwo+IC0Jc3RydWN0IHJhc19tYW5hZ2VyICpvYmo7Cj4gICAKPiAgIAlzID0gc2Nu
cHJpbnRmKGJ1ZiwgUEFHRV9TSVpFLCAiZmVhdHVyZSBtYXNrOiAweCV4XG4iLCBjb24tPmZlYXR1
cmVzKTsKPiAgIAo+ICAgCWZvciAoaSA9IDA7IGkgPCByYXNfYmxvY2tfY291bnQ7IGkrKykgewo+
ICAgCQloZWFkLmJsb2NrID0gaTsKPiArCQllbmFibGVkID0gYW1kZ3B1X3Jhc19pc19mZWF0dXJl
X2VuYWJsZWQoYWRldiwgJmhlYWQpOwo+ICAgCj4gLQkJaWYgKGFtZGdwdV9yYXNfaXNfZmVhdHVy
ZV9lbmFibGVkKGFkZXYsICZoZWFkKSkgewo+IC0JCQlvYmogPSBhbWRncHVfcmFzX2ZpbmRfb2Jq
KGFkZXYsICZoZWFkKTsKPiAtCQkJcyArPSBzY25wcmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0g
cywKPiAtCQkJCQkiJXM6ICVzXG4iLAo+IC0JCQkJCXJhc19ibG9ja19zdHIoaSksCj4gLQkJCQkJ
cmFzX2Vycl9zdHIob2JqLT5oZWFkLnR5cGUpKTsKPiAtCQl9IGVsc2UKPiAtCQkJcyArPSBzY25w
cmludGYoJmJ1ZltzXSwgUEFHRV9TSVpFIC0gcywKPiAtCQkJCQkiJXM6IGRpc2FibGVkXG4iLAo+
IC0JCQkJCXJhc19ibG9ja19zdHIoaSkpOwo+ICsJCXMgKz0gc2NucHJpbnRmKCZidWZbc10sIFBB
R0VfU0laRSAtIHMsCj4gKwkJCQkiJXMgcmFzIGZlYXR1cmUgbWFzazogJXNcbiIsCj4gKwkJCQly
YXNfYmxvY2tfc3RyKGkpLCBlbmFibGVkPyJvbiI6Im9mZiIpOwo+ICAgCX0KPiAgIAo+ICAgCXJl
dHVybiBzOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
