Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C7621001
	for <lists+amd-gfx@lfdr.de>; Thu, 16 May 2019 23:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E203789612;
	Thu, 16 May 2019 21:30:42 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
 [209.85.222.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75FF89612
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 21:30:41 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id d10so3268093qko.4
 for <amd-gfx@lists.freedesktop.org>; Thu, 16 May 2019 14:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=rQG6tgG223bgtUDzcGh22j8Ans5JCJTK64QXPq3vUvY=;
 b=XEPy/t5IlONsK98oeJIejwtU+E26CHpNuzeDH3xiEtB6GXSOwB+smQTA64jqmMZ2+b
 C4OET/WQVGWKH1NDP3P/AB5EHlnhimXYUt4n3VLGFXW+E8/vYvUmdqi/RJtXduBD1lmj
 6Uqnj94b37BHptS9cNQa9g60B/8lndKyLR9X8Wx+w53JJiNwjEPdpHF2910+BHFnCmV9
 oT4R1MQuDUGBgeSxzaJMEeCqDzQhh5m0NcgAHxWgBvhJL9ohDVIKPE1R4SfPbu0wO3UG
 RGBSgeMaOvdhsjOwKOfKEhNUX/zGvUITOSK1R0gEPBUXNPmW0XyKZWczK2lZl5MrGyze
 iGLw==
X-Gm-Message-State: APjAAAXFrjx/NzzNZXsy8DbdswESmAQ6mhDzn2xH2zByc5Jq0boBFZbb
 3NTZ7LG0mGSqgFiRjEjIYXuuPw==
X-Google-Smtp-Source: APXvYqxlLS/ktJQ/8dOXtNMo2h9nLcUV5mCWZ0bD9ZTiLjRLoRJbJQkg3k87UhZhvRG2EA4ujjEmGA==
X-Received: by 2002:a37:6596:: with SMTP id
 z144mr39605089qkb.341.1558042241069; 
 Thu, 16 May 2019 14:30:41 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id g41sm3786073qte.79.2019.05.16.14.30.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 16 May 2019 14:30:40 -0700 (PDT)
Message-ID: <ac237b02ecfd4e294a1abdd3275362484ae95c9b.camel@redhat.com>
Subject: Re: [PATCH 3/7] drm/dp-mst: Use connector kdev as aux device parent
From: Lyude Paul <lyude@redhat.com>
To: sunpeng.li@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Date: Thu, 16 May 2019 17:30:39 -0400
In-Reply-To: <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
References: <1558019883-12397-1-git-send-email-sunpeng.li@amd.com>
 <1558019883-12397-4-git-send-email-sunpeng.li@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
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
Cc: Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

YWdoLS0tLXNvcnJ5LCBidXQgSSBuZWVkIHRvIHRha2UgYmFjayBteSBSZXZpZXdlZC1ieS4gTm90
aWNlZCBhbiBpc3N1ZSB3aGVuIApyZWxvYWRpbmcgZHJtIGFuZCBpOTE1LiBJJ2xsIGV4cGxhaW4g
aXQgd2hlbiBJIHJlc3BvbmQgdG8gcGF0Y2ggMi83IGluIGEKbW9tZW50CgpPbiBUaHUsIDIwMTkt
MDUtMTYgYXQgMTE6MTcgLTA0MDAsIHN1bnBlbmcubGlAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBM
ZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KPiAKPiBQbGFjaW5nIHRoZSBNU1QgYXV4IGRldmlj
ZSBhcyBhIGNoaWxkIG9mIHRoZSBjb25uZWN0b3IgZ2l2ZXMgdWRldiB0aGUKPiBhYmlsaXR5IHRv
IGFjY2VzcyB0aGUgY29ubmVjdG9yIGRldmljZSdzIGF0dHJpYnV0ZXMuIFRoaXMgd2lsbCBjb21l
IGluCj4gaGFuZHkgd2hlbiB3cml0aW5nIHVkZXYgcnVsZXMgdG8gY3JlYXRlIG1vcmUgZGVzY3Jp
cHRpdmUgc3ltbGlua3MgdG8gdGhlCj4gTVNUIGF1eCBkZXZpY2VzLgo+IAo+IENjOiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+IENjOiBMeXVkZSBQYXVs
IDxseXVkZUByZWRoYXQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IExlbyBMaSA8c3VucGVuZy5saUBh
bWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwg
MyArKysKPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gaW5kZXggNTRkYTY4ZS4uY2QyZjNjNCAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC0xMjY5LDYgKzEyNjksOSBA
QCBzdGF0aWMgdm9pZCBkcm1fZHBfYWRkX3BvcnQoc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoCj4g
Km1zdGIsCj4gIAkJfQo+ICAJCSgqbXN0Yi0+bWdyLT5jYnMtPnJlZ2lzdGVyX2Nvbm5lY3Rvciko
cG9ydC0+Y29ubmVjdG9yKTsKPiAgCj4gKwkJaWYgKHBvcnQtPmNvbm5lY3Rvci0+cmVnaXN0cmF0
aW9uX3N0YXRlID09Cj4gRFJNX0NPTk5FQ1RPUl9SRUdJU1RFUkVEKQo+ICsJCQlwb3J0LT5hdXgu
ZGV2ID0gcG9ydC0+Y29ubmVjdG9yLT5rZGV2Owo+ICsKPiAgCQlkcm1fZHBfYXV4X3JlZ2lzdGVy
X2Rldm5vZGUoJnBvcnQtPmF1eCk7Cj4gIAl9Cj4gIAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
