Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B905BE0702
	for <lists+amd-gfx@lfdr.de>; Tue, 22 Oct 2019 17:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C766E83F;
	Tue, 22 Oct 2019 15:07:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068436E83F
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 15:07:05 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t16so13348180wrr.1
 for <amd-gfx@lists.freedesktop.org>; Tue, 22 Oct 2019 08:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=E3ER1AlYXvR263d1j79thkAtPSKbzm9oS/Bl9ODZgIM=;
 b=l9i0+9iMCa/Fk6x4i/xhbxaTm5OL3TJ22+L2fWTBguw0gW0jiezML9E/F283rkkedJ
 1unxViXXA0uk+V2Xlot4W8O3XCNsfqxDDVLONsSobUt/MFwMtV2CLuvs9CNTOyIh63lj
 5QhUvofCijhl6MBA0snhjTrFR8Wv5CuNJsYHoPaxyYxkGQap1n6BGUYbsqKyHyhVpLXX
 BgYmBn2aM2pnbiWhKKkzpRN9KhcWoer0zVozME3EJCJDFSzGi44ar4M8agI2zMnoPOkJ
 +AS7SL02XfsVd/lsVpUu72aDHxwo1EOZbk0zXfiWs/IV/HMX4UtHwjOGxx6ogZ/8utC6
 Ww5w==
X-Gm-Message-State: APjAAAWh6c1xfmBcyqnUbTwrdZR+b0E07+QESm3DfQvXmEllaCdfZiF4
 yAOIUBr+VMs8VTSEbvoUDjReL0YA
X-Google-Smtp-Source: APXvYqxzSoaLlRw4lQPLFNBE5+Q7kt28ADDS3y5r9/hvKTGZq9V+NP6tOY/4vuePjWtoXY4OREsj7Q==
X-Received: by 2002:adf:f2c1:: with SMTP id d1mr1593220wrp.247.1571756824353; 
 Tue, 22 Oct 2019 08:07:04 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id s14sm5264044wmh.18.2019.10.22.08.07.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Oct 2019 08:07:03 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu/vcn: Enable VCN2.5 encoding
To: "Liu, Leo" <Leo.Liu@amd.com>, "Zhu, James" <James.Zhu@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <1571755708-12173-1-git-send-email-James.Zhu@amd.com>
 <DM5PR12MB2456F9E06D30C7AE9202E955E5680@DM5PR12MB2456.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <411b35f0-9333-eac8-4cd3-25031869c082@gmail.com>
Date: Tue, 22 Oct 2019 14:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB2456F9E06D30C7AE9202E955E5680@DM5PR12MB2456.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=E3ER1AlYXvR263d1j79thkAtPSKbzm9oS/Bl9ODZgIM=;
 b=aGz5CTnvnb9zSL95M20JaeXqq6z0xeQQ5RuB+fJUF42IwaRliZta7z7Wue72/6OxoG
 gv1Hz+AK/ha1oJNG8TOxXBp78oEZ47qbjsbt0/LjsEJhPOtZXJe1FlniOjXzdk7i8anI
 hSw8Qms8OGlGydP8rkihGQXGjJQItOhh9hfn2stVspcQjeNx54UTbYfIM7OpLL3uPwvn
 NPeAeXNW3Ce6SyDleWonJsUGaGnPTsMv8lFqF4wo+cMT/gddAblvYJ3zqrDwOKQNfXlT
 N89HmZ52pwxjC3ZVEXnTruvOAvCOvz/dUzt3lVFFQ0sN0n5TbElIo+ZRrp+jDTA6T2c6
 9IZw==
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

SGF2ZSB3ZSBldmVyIHB1Ymxpc2hlZCBhbiBvbGRlciB2ZXJzaW9uIG9mIHRoZSBmaXJtd2FyZT8K
Ckkgc3Ryb25nbHkgYXNzdW1lIHRoZSBhbnN3ZXIgaXMgIm5vIiBhbmQgaWYgdGhhdCdzIHRoZSBj
YXNlIGZlZWwgZnJlZSB0byAKYWRkIGFuIFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKQW0gMjIuMTAu
MTkgdW0gMTY6NTAgc2NocmllYiBMaXUsIExlbzoKPiBSZXZpZXdlZC1ieTogTGVvIExpdSA8bGVv
LmxpdUBhbWQuY29tPgo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBhbWQt
Z2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2Yg
Wmh1LCBKYW1lcwo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9iZXIgMjIsIDIwMTkgMTA6NDkgQU0KPiBU
bzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogWmh1LCBKYW1lcyA8SmFtZXMu
Wmh1QGFtZC5jb20+Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L3ZjbjogRW5hYmxlIFZD
TjIuNSBlbmNvZGluZwo+Cj4gQWZ0ZXIgVkNOMi41IGZpcm13YXJlIChWZXJzaW9uIEVOQzogMS4x
ICBSZXZpc2lvbjogMTEpLAo+IFZDTjIuNSBlbmNvZGluZyBjYW4gd29yayBwcm9wZXJseS4KPgo+
IFNpZ25lZC1vZmYtYnk6IEphbWVzIFpodSA8SmFtZXMuWmh1QGFtZC5jb20+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jIHwgMyAtLS0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3Zjbl92Ml81LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS92Y25fdjJf
NS5jCj4gaW5kZXggZDI3MGRmOC4uZmY2Y2M3NyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS92Y25fdjJfNS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvdmNuX3YyXzUuYwo+IEBAIC0yNjUsOSArMjY1LDYgQEAgc3RhdGljIGludCB2Y25fdjJfNV9o
d19pbml0KHZvaWQgKmhhbmRsZSkKPiAgIAo+ICAgCQlmb3IgKGkgPSAwOyBpIDwgYWRldi0+dmNu
Lm51bV9lbmNfcmluZ3M7ICsraSkgewo+ICAgCQkJcmluZyA9ICZhZGV2LT52Y24uaW5zdFtqXS5y
aW5nX2VuY1tpXTsKPiAtCQkJLyogZGlzYWJsZSBlbmNvZGUgcmluZ3MgdGlsbCB0aGUgcm9idXN0
bmVzcyBvZiB0aGUgRlcgKi8KPiAtCQkJcmluZy0+c2NoZWQucmVhZHkgPSBmYWxzZTsKPiAtCQkJ
Y29udGludWU7Cj4gICAJCQlyID0gYW1kZ3B1X3JpbmdfdGVzdF9oZWxwZXIocmluZyk7Cj4gICAJ
CQlpZiAocikKPiAgIAkJCQlnb3RvIGRvbmU7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZng=
