Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBADE8D6D7
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Aug 2019 17:06:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9796E614;
	Wed, 14 Aug 2019 15:06:29 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8916C6E614
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 15:06:27 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y8so5475076wrn.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 14 Aug 2019 08:06:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=H5rYP1i16wUgUjWhKHklwcv8aWMB5X53vM+9Rc38K24=;
 b=omjMfL/XytmGnFl8RWUNGF4WzkvnwUZl1N4XJ84pcAldFx8J10VAnXccxjtRrSfnzP
 amD8NpA3CoweZt0BR6wbnlPszfWzWPxbQ6hTn8lmpOX0BY0XkZ6q/VA+8b66Ic+oTgmM
 DZS9U4D699OGByqQTlwKkhgWf9R17TQ3COPtPFeZhwCPZXsNR32gu/u1YSrh6QTkM7sc
 wL5ghq2doYes/XhJjXQDKULhJDTY8Vtk94VobXtDJ+9uBaQOpOsU/CenkD+9paXasswV
 pkkKB+wKGQw21o8AtpCkNda9AKrr8SKQtg1QqRiESYoggEqtx8qhsq31HwApOeGB56sd
 xt9A==
X-Gm-Message-State: APjAAAWJUtZ7hCOD4CPv1szf4TNYhm9GzYXho4gyvWTQM4J3bzaSUsO6
 8ZpTdBMSa4Z1kCRpu4al6B6JcpIL
X-Google-Smtp-Source: APXvYqx2cMbkosbv9G7Zh+e8HbHY4RJmrVEfa+xZfwM++DfeybOwpohH4O8rNBrPY4E3Yp5RSb/S5w==
X-Received: by 2002:adf:e2c7:: with SMTP id d7mr191644wrj.68.1565795186167;
 Wed, 14 Aug 2019 08:06:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g14sm120991wrb.38.2019.08.14.08.06.25
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 14 Aug 2019 08:06:25 -0700 (PDT)
Subject: Re: [PATCH] Update VM function point when VM state changed.
To: Gang Ba <gaba@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1565794853-25275-1-git-send-email-gaba@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <d21d6399-fe1d-72b1-167a-c117c2a34a6b@gmail.com>
Date: Wed, 14 Aug 2019 17:06:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1565794853-25275-1-git-send-email-gaba@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=H5rYP1i16wUgUjWhKHklwcv8aWMB5X53vM+9Rc38K24=;
 b=i4hTJ4y5yXDb0lSZ8sR82KE5ZqhFD3FJHypRLso1HgMv+duWThi89qlXwsm+jYW+ly
 I3vANfMlF//VHD7mU5SlHworiPkrAR74q8xQ4Nhuk+H9sjVOxxJrfDl0TaXMbeXO2xll
 /+oINr8pW+zLQpDcD6mOugZ/p67Q7kbJrAhU8jp+ZCPD/XTXdN0sKaCaNGld4gcfnDD2
 cpptbs+LPayS7XmOG+NsemRPDQVDi3QAWdbUqqMwTo6cfWCGagY7rLIrUBfauwKAfDeJ
 jScKmhI0VQlXJeSadJNK4mnKCcYRlTuy6FQAvtpsDaxPLN3fBTS2/taDK5b2o3BfVdTD
 iyIQ==
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

QW0gMTQuMDguMTkgdW0gMTc6MDEgc2NocmllYiBHYW5nIEJhOgo+IENoYW5nZS1JZDogSWJjZmFk
YTU2MGEwMGM5YWVlYmZkOTIyYWU0OGRlOTIwZTQ0YTU4NjYKPiBTaWduZWQtb2ZmLWJ5OiBHYW5n
IEJhIDxnYWJhQGFtZC5jb20+CgpHb29kIGNhdGNoLCBidXQgdGhlcmUgaXMgYSBwcm9ibGVtIGJl
bG93LgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwg
NiArKysrKysKPiAgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gaW5kZXggYzFiYWYzZC4uNzJkZDQzNCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAgLTI4NjIsNiArMjg2
MiwxMiBAQCBpbnQgYW1kZ3B1X3ZtX21ha2VfY29tcHV0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiwgc3RydWN0IGFtZGdwdV92bSAqdm0sIHVucwo+ICAgCVdBUk5fT05DRSgodm0tPnVzZV9j
cHVfZm9yX3VwZGF0ZSAmJiAhYW1kZ3B1X2dtY192cmFtX2Z1bGxfdmlzaWJsZSgmYWRldi0+Z21j
KSksCj4gICAJCSAgIkNQVSB1cGRhdGUgb2YgVk0gcmVjb21tZW5kZWQgb25seSBmb3IgbGFyZ2Ug
QkFSIHN5c3RlbVxuIik7Cj4gICAKPiArCWlmICh2bS0+dXNlX2NwdV9mb3JfdXBkYXRlKQo+ICsJ
CXZtLT51cGRhdGVfZnVuY3MgPSAmYW1kZ3B1X3ZtX2NwdV9mdW5jczsKPiArCWVsc2UKPiArCQl2
bS0+dXBkYXRlX2Z1bmNzID0gJmFtZGdwdV92bV9zZG1hX2Z1bmNzOwo+ICsJdm0tPmxhc3RfdXBk
YXRlID0gTlVMTDsKCllvdSBjYW4ndCBqdXN0IHNldCBsYXN0X3VwZGF0ZSB0byBOVUxMIG9yIHlv
dXIgd291bGQgbGVhayB0aGUgbWVtb3J5IHRoZSAKZmVuY2Ugb2NjdXBpZXMuIFNvIHRoaXMgbmVl
ZHMgdG8gYmU6CgpkbWFfZmVuY2VfcHV0KHZtLT5sYXN0X3VwZGF0ZSk7CnZtLT5sYXN0X3VwZGF0
ZSA9IE5VTEw7CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+ICsKPiAgIAlpZiAodm0tPnBhc2lkKSB7
Cj4gICAJCXVuc2lnbmVkIGxvbmcgZmxhZ3M7Cj4gICAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeA==
