Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBF46A775
	for <lists+amd-gfx@lfdr.de>; Tue, 16 Jul 2019 13:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA006E10C;
	Tue, 16 Jul 2019 11:31:00 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C1F6E118
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 11:30:59 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id v19so18331919wmj.5
 for <amd-gfx@lists.freedesktop.org>; Tue, 16 Jul 2019 04:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Hl1G5AU7kxvjuPGRihYhWYt3F88AFzvztZyAZhdRt7c=;
 b=E1LzD2gGtDMeYATxxbME3sDAzW2UV+AqwefOccKj605EguhtdXaE+CLGTioc1B0eki
 VlSXIZOm0IkFaXB/8l3U9vYggrlJowSsSbASjrLWh2y36v+E8iGwNaAO/Jv+t5iKxGT+
 DEBnW9/GvZwV+O7EbGCRUFMI3W+T1SQeho9vniW7vhrpCVfvTEqDs0OWxOikA9m1phCB
 elCCrlBPrbyHM7/QlHiBQ0l8b2kIKy7GXl6RYCdYXboXxneB0WIo/tNkB68yz7/UGtNt
 hn1JdnmvEnAg2JP3mouMihRCFnqnn5+oEJocY+j8zbod7+uKQbD47bLshO7bWVt1unja
 b1bQ==
X-Gm-Message-State: APjAAAWiwNro9Kr83Sr2yzJAIczZDozfrpaOJqihgPd9jqr+r3dLcSRJ
 ElBtiwFTcrIFUOpW8ZMZlyuNznTZ
X-Google-Smtp-Source: APXvYqxcqgu5Hdqs9JDqKAuZdpfGWLoIZ0equQ0vm8kE87BL0Z4diyUXHQcCYl6VBynsurH6jc0Bfg==
X-Received: by 2002:a1c:56d7:: with SMTP id k206mr29372580wmb.56.1563276657748; 
 Tue, 16 Jul 2019 04:30:57 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o6sm38433757wra.27.2019.07.16.04.30.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:30:57 -0700 (PDT)
Subject: Re: [PATCH] drm/amd/amdgpu: Fix offset for vmid selection in debugfs
 interface
To: "StDenis, Tom" <Tom.StDenis@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20190716112434.29017-1-tom.stdenis@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e6bc6d43-d4ac-467f-22b3-2be79619b93e@gmail.com>
Date: Tue, 16 Jul 2019 13:30:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190716112434.29017-1-tom.stdenis@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Hl1G5AU7kxvjuPGRihYhWYt3F88AFzvztZyAZhdRt7c=;
 b=DQ6zbS5d2qGm3FvqwjqM+DdXt+n7lPqTj1wCE15CxTY1UUEczLEelrVYZzsmOukggg
 SAOX7VpH6dHBG4n0zgO8KMMwDaSJbOD3JUyoYcqOb55uRyWyopNmNqUjrn7tqf6DZOzu
 TR1GKz1rEBffuC5FLCtYgeYpkwcfT9nsMTogvvUg6Up+31PVmnq+zr67K4WqqoSl4bDT
 agdsWiOUVLDPpCfwOhykfH4moDt1lwoIOKWXJK6ciISFeuBcBGrh+k1D/gkr5PeT9tcJ
 Tz5AT0CWCUATzCVx6JpCIEny6Kapo+Dl+9zpAAkFdRel1RARKZRl9QCyo8qPD/Sbz8az
 8ewg==
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

QW0gMTYuMDcuMTkgdW0gMTM6MjQgc2NocmllYiBTdERlbmlzLCBUb206Cj4gVGhlIHJlZ2lzdGVy
IGRlYnVnZnMgaW50ZXJmYWNlIHdhcyB1c2luZyB0aGUgd3JvbmcgYml0bWFzayBmb3Igdm1pZAo+
IHNlbGVjdGlvbiBmb3IgR0ZYX0NOVEwuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUb20gU3QgRGVuaXMg
PHRvbS5zdGRlbmlzQGFtZC5jb20+CgpBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0
aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9kZWJ1Z2ZzLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2RlYnVnZnMuYwo+IGluZGV4IDg3YjMyODczMDQ2Zi4uNTk4NDllZDk3OTdkIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4gQEAgLTEzMiw3ICsx
MzIsNyBAQCBzdGF0aWMgaW50ICBhbWRncHVfZGVidWdmc19wcm9jZXNzX3JlZ19vcChib29sIHJl
YWQsIHN0cnVjdCBmaWxlICpmLAo+ICAgCQltZSA9ICgqcG9zICYgR0VOTUFTS19VTEwoMzMsIDI0
KSkgPj4gMjQ7Cj4gICAJCXBpcGUgPSAoKnBvcyAmIEdFTk1BU0tfVUxMKDQzLCAzNCkpID4+IDM0
Owo+ICAgCQlxdWV1ZSA9ICgqcG9zICYgR0VOTUFTS19VTEwoNTMsIDQ0KSkgPj4gNDQ7Cj4gLQkJ
dm1pZCA9ICgqcG9zICYgR0VOTUFTS19VTEwoNDgsIDQ1KSkgPj4gNTQ7Cj4gKwkJdm1pZCA9ICgq
cG9zICYgR0VOTUFTS19VTEwoNTgsIDU0KSkgPj4gNTQ7Cj4gICAKPiAgIAkJdXNlX3JpbmcgPSAx
Owo+ICAgCX0gZWxzZSB7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
