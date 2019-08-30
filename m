Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6577A3061
	for <lists+amd-gfx@lfdr.de>; Fri, 30 Aug 2019 09:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA34890E5;
	Fri, 30 Aug 2019 07:09:40 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A56F890E5
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 07:09:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so3038099wrv.11
 for <amd-gfx@lists.freedesktop.org>; Fri, 30 Aug 2019 00:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bp2m7k+nF1FIvzKJCiEbrdUOlQGfI/vYYGAI/iDsMpc=;
 b=kc/ZAj2k81lPAqQ/q3IQ8f3a0Tx8cmiN9u4PgGqt/hQcn7qSR6wYGmwZJxc56lg3Uj
 mUo6UXZ+TuXDbA2/PI8kcmfkEYorLwYCxyNq63lxlbDyui255ly3oWKF+SGYOmgKTgqL
 ZIGPBqzF6lcHUCUl3nXdOSqUFEwaBEVuTVqou/8tghGqhV5+luVHApqMtG0m0cVWpYR2
 18GxRARjem8Jgy02NkhTXefzA6MFr8+M+V7zYZ/fKXRBR/VPdD5v8ZeWMkhHU3O6Nyxw
 97BCoKz+0/m76fzBvy0OYffm9U8opJYH31BRo+DBzsrg5SJ2kgrpgwM1SwyRtpl+dXcG
 x49w==
X-Gm-Message-State: APjAAAVj0X+QKDN5wzHgL5/E6RsZ98u1i4euV6SIrjFjzamq0B/FVvRO
 YyW1+eThqoTatCDrbA6fmLhLHHsp
X-Google-Smtp-Source: APXvYqyiNYiue5/+xVnhXw7/IT7PM33q3L9g69qc0zzzpCg9OAXX7f9Rttj84YUhfCgBHzfdqW/pUw==
X-Received: by 2002:a5d:6446:: with SMTP id d6mr1959568wrw.159.1567148977937; 
 Fri, 30 Aug 2019 00:09:37 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h23sm6322967wml.43.2019.08.30.00.09.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Aug 2019 00:09:37 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/amdgpu: Remove unnecessary TLB workaround
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190830051443.3906-1-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <41d07a88-24d3-2744-55cb-b920880f618c@gmail.com>
Date: Fri, 30 Aug 2019 09:09:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190830051443.3906-1-Felix.Kuehling@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bp2m7k+nF1FIvzKJCiEbrdUOlQGfI/vYYGAI/iDsMpc=;
 b=C9u+sTfDdK9hszlFbn0kxEm8RiYsOHX+MJmIntIE49n11yPZqERJ9zngQAQaowmCbz
 oa2AfnqEoyLTUgaDg/Hmxdn2c5x9/C/wNdaPp3ofLoj4hl6zviy2X25RpEjFqRaEslLX
 rmBQUofuMm54LiaUoqyZr6h+/U65ENh8H5ghyO+djrQD+IUM9qpDWY/7xeuVFGkkwTXp
 PKrhqggtC18lrEo6YNPmJf0squBmnXi0WiQBhiL2B3naeg38RcvU305ZA/Y7lTO/hnST
 HSSNpRfe9LxMSCLDl7GPwtA4C2+vGUejft/M/AqKMph7ODx8oFolKc1bzxh5Oq+X0fV7
 FOGA==
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

QW0gMzAuMDguMTkgdW0gMDc6MTQgc2NocmllYiBLdWVobGluZywgRmVsaXg6Cj4gVGhpcyB3b3Jr
YXJvdW5kIGlzIGJldHRlciBoYW5kbGVkIGluIHVzZXIgbW9kZSBpbiBhIHdheSB0aGF0IGRvZXNu
J3QKPiByZXF1aXJlIGFsbG9jYXRpbmcgZXh0cmEgbWVtb3J5IGFuZCBicmVha2luZyB1c2VycHRy
IEJPcy4KPgo+IFRoZSBUTEIgYnVnIGlzIGEgcGVyZm9ybWFuY2UgYnVnLCBub3QgYSBmdW5jdGlv
bmFsIG9yIHNlY3VyaXR5IGJ1Zy4KPiBIZW5jZSBpdCBpcyBzYWZlIHRvIHJlbW92ZSB0aGlzIGtl
cm5lbCBwYXJ0IG9mIHRoZSB3b3JrYXJvdW5kIHRvCj4gYWxsb3cgYSBiZXR0ZXIgd29ya2Fyb3Vu
ZCB1c2luZyBvbmx5IHZpcnR1YWwgYWRkcmVzcyBhbGlnbm1lbnRzIGluCj4gdXNlciBtb2RlLgo+
Cj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
CgpNYXliZSB0aGUgVklfQk9fU0laRV9BTElHTiBkZWZpbmUgY2FuIG5vdyBiZSByZW1vdmVkIGFz
IHdlbGw/CgpBcGFydCBmcm9tIHRoYXQgdGhpcyBwYXRjaCBpcyBSZXZpZXdlZC1ieTogQ2hyaXN0
aWFuIEvDtm5pZyAKPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4uCgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIHwgMTIgKy0tLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDExIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRf
Z3B1dm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0u
Ywo+IGluZGV4IDQyZDIwOWY1ZmQxOC4uMmM3M2VhN2M0MjVjIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRfZ3B1dm0uYwo+IEBAIC0xMTEwLDcg
KzExMTAsNiBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAo+
ICAgCXVpbnQ2NF90IHVzZXJfYWRkciA9IDA7Cj4gICAJc3RydWN0IGFtZGdwdV9ibyAqYm87Cj4g
ICAJc3RydWN0IGFtZGdwdV9ib19wYXJhbSBicDsKPiAtCWludCBieXRlX2FsaWduOwo+ICAgCXUz
MiBkb21haW4sIGFsbG9jX2RvbWFpbjsKPiAgIAl1NjQgYWxsb2NfZmxhZ3M7Cj4gICAJaW50IHJl
dDsKPiBAQCAtMTE2NSwxNSArMTE2NCw2IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FsbG9j
X21lbW9yeV9vZl9ncHUoCj4gICAJaWYgKCgqbWVtKS0+YXFsX3F1ZXVlKQo+ICAgCQlzaXplID0g
c2l6ZSA+PiAxOwo+ICAgCj4gLQkvKiBXb3JrYXJvdW5kIGZvciBUTEIgYnVnIG9uIG9sZGVyIFZJ
IGNoaXBzICovCj4gLQlieXRlX2FsaWduID0gKGFkZXYtPmZhbWlseSA9PSBBTURHUFVfRkFNSUxZ
X1ZJICYmCj4gLQkJCWFkZXYtPmFzaWNfdHlwZSAhPSBDSElQX0ZJSkkgJiYKPiAtCQkJYWRldi0+
YXNpY190eXBlICE9IENISVBfUE9MQVJJUzEwICYmCj4gLQkJCWFkZXYtPmFzaWNfdHlwZSAhPSBD
SElQX1BPTEFSSVMxMSAmJgo+IC0JCQlhZGV2LT5hc2ljX3R5cGUgIT0gQ0hJUF9QT0xBUklTMTIg
JiYKPiAtCQkJYWRldi0+YXNpY190eXBlICE9IENISVBfVkVHQU0pID8KPiAtCQkJVklfQk9fU0la
RV9BTElHTiA6IDE7Cj4gLQo+ICAgCSgqbWVtKS0+YWxsb2NfZmxhZ3MgPSBmbGFnczsKPiAgIAo+
ICAgCWFtZGdwdV9zeW5jX2NyZWF0ZSgmKCptZW0pLT5zeW5jKTsKPiBAQCAtMTE4OSw3ICsxMTc5
LDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWxsb2NfbWVtb3J5X29mX2dwdSgKPiAgIAo+
ICAgCW1lbXNldCgmYnAsIDAsIHNpemVvZihicCkpOwo+ICAgCWJwLnNpemUgPSBzaXplOwo+IC0J
YnAuYnl0ZV9hbGlnbiA9IGJ5dGVfYWxpZ247Cj4gKwlicC5ieXRlX2FsaWduID0gMTsKPiAgIAli
cC5kb21haW4gPSBhbGxvY19kb21haW47Cj4gICAJYnAuZmxhZ3MgPSBhbGxvY19mbGFnczsKPiAg
IAlicC50eXBlID0gYm9fdHlwZTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1k
LWdmeA==
