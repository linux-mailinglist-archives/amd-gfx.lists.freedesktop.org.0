Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 294098DC8A
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 19:59:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1DB589D67;
	Wed, 14 Aug 2019 17:59:54 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8146D89D67
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 17:59:52 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j16so9678919wrr.8
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 10:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=KsBhLJjPdQYS+oRs06iuUQZKvkz4rX+rErw80eLnjwk=;
 b=f8MfT9BG83jfrSHRATNs0SF+sbc780QMcaV8H3UguNmFQRDUeKQAQC4X10CpPhqjCt
 NAKNRNqvpPhSKKk1qolXJdAClB5id7baJZ95A20jXr7twuJsErTPhxyoZqaPNpbiZDhv
 0fAlKZA8KTh+g39idUq8qvux8PHIDzs4yxqHfKuzjFGdU2W9TvRZi4Tgqt5arEFxJKIr
 reoZsS0LCOuiJ2AREGnoNp7ppVyt7mRpjhWGDG+BTYNG49Z1NqhMbKaSGyMAjtsWrxTj
 NWwzgR+HxjoNoMN4MW0W7aPbrMJ+aH9E5FWBmv8lpt3YZAmfeARFF/xgRO2eyzjF9KQd
 CQ5w==
X-Gm-Message-State: APjAAAXQIzzfXpRtiQvoX3ZbkPzK9qGMowqz/sGE0VQuwPAQNTAch+GB
 UKmbhCcCpkq6nA6DtYnzqxweJpHR
X-Google-Smtp-Source: APXvYqx+ii/sOIF3x1AH/N//3MrstuSXKPfkirn1tpzoEHfm8rWVkECe0iqZx3B9O9C50GUx5/qjzQ==
X-Received: by 2002:adf:a2cd:: with SMTP id t13mr963359wra.251.1565805591205; 
 Wed, 14 Aug 2019 10:59:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x20sm948144wrg.10.2019.08.14.10.59.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 10:59:50 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Update VM function pointer
To: Gang Ba <gaba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1565804106-21037-1-git-send-email-gaba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5a32df63-c598-8829-0341-ec9569f0731f@gmail.com>
Date: Wed, 14 Aug 2019 19:59:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565804106-21037-1-git-send-email-gaba@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KsBhLJjPdQYS+oRs06iuUQZKvkz4rX+rErw80eLnjwk=;
 b=vc2PT1xbV5jGEiaeHYf3GhwGi7hW0kHA3tnqDUn14zaLPV0jPSoKj8moO0bsqfAE4z
 kI2gm3FL5LbO1zIo3LPnkaXaZJLIes2vkadrBNhHWqAim+Y2JoajYPqlxf6hgn8aFX2g
 zfhys/SRCUz1Dj66Q7uaUMp4sZwq3FYRaAwpuoOzU4XWG+NyXxFDzu+W6gJ6MQX0x04H
 +nobU9NjuSBN6c8pOtewhUcSiFngYNG0fBKmd32+6onnfd9cjvSyJEQlvP/SEnvqS/SZ
 5Kcv3PUYCswPTypPwT/0AdK2JYtWdZFKW3FMOQ9NCl0cirBzQ+WcVBk804TWpZK25bnO
 2xdQ==
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
Cc: "Ba, Gang" <Gang.Ba@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTQuMDguMTkgdW0gMTk6MzUgc2NocmllYiBHYW5nIEJhOgo+ICAgIFdoZW4gVk0gc3RhdGUg
Y2hhbmdlZCBhbmQgc3lzdGVtIGluIGxhcmdlIGJhciBtb2RlLAo+ICAgIG1ha2Ugc3VyZSB0byB1
c2UgQ1BVIHVwZGF0ZSBmdW5jdGlvbiwgb3RoZXJ3aXNlIHVzZQo+ICAgIFNETUEgZnVuY3Rpb24u
CgpMb29rcyBsaWtlIHlvdSBoYXZlIHNvbWUgZXh0cmEgc3BhY2VzIGluIGZyb250IG9mIHRoZSBj
b21taXQgbWVzc2FnZS4KCkFwYXJ0IGZyb20gdGhhdCBsb29rcyBnb29kIHRvIG1lIG5vdyBhbmQg
Zml4IHRoZSBjb21taXQgbWVzc2FnZSBmaXhlZCBpdCAKaXMgUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
Cj4KPiBDaGFuZ2UtSWQ6IEliY2ZhZGE1NjBhMDBjOWFlZWJmZDkyMmFlNDhkZTkyMGU0NGE1ODY2
Cj4gU2lnbmVkLW9mZi1ieTogR2FuZyBCYSA8Z2FiYUBhbWQuY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCA3ICsrKysrKysKPiAgIDEgZmlsZSBj
aGFuZ2VkLCA3IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4gaW5kZXggYzFiYWYzZC4uN2RkY2EzZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAgLTI4NjIsNiArMjg2MiwxMyBAQCBpbnQgYW1kZ3B1X3Zt
X21ha2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV92
bSAqdm0sIHVucwo+ICAgCVdBUk5fT05DRSgodm0tPnVzZV9jcHVfZm9yX3VwZGF0ZSAmJiAhYW1k
Z3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgmYWRldi0+Z21jKSksCj4gICAJCSAgIkNQVSB1cGRh
dGUgb2YgVk0gcmVjb21tZW5kZWQgb25seSBmb3IgbGFyZ2UgQkFSIHN5c3RlbVxuIik7Cj4gICAK
PiArCWlmICh2bS0+dXNlX2NwdV9mb3JfdXBkYXRlKQo+ICsJCXZtLT51cGRhdGVfZnVuY3MgPSAm
YW1kZ3B1X3ZtX2NwdV9mdW5jczsKPiArCWVsc2UKPiArCQl2bS0+dXBkYXRlX2Z1bmNzID0gJmFt
ZGdwdV92bV9zZG1hX2Z1bmNzOwo+ICsJZG1hX2ZlbmNlX3B1dCh2bS0+bGFzdF91cGRhdGUpOwo+
ICsJdm0tPmxhc3RfdXBkYXRlID0gTlVMTDsKPiArCj4gICAJaWYgKHZtLT5wYXNpZCkgewo+ICAg
CQl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ICAgCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
