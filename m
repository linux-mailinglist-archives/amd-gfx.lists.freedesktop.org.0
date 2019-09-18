Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AAB6F82
	for <lists+amd-gfx@lfdr.de>; Thu, 19 Sep 2019 01:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDE17AF91;
	Wed, 18 Sep 2019 23:01:30 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Wed, 18 Sep 2019 23:01:30 UTC
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355377AF91
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 23:01:30 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-rRFRg54KORmsGP_wiUxaFA-1; Wed, 18 Sep 2019 18:55:20 -0400
Received: by mail-qk1-f198.google.com with SMTP id w7so1852135qkf.10
 for <amd-gfx@lists.freedesktop.org>; Wed, 18 Sep 2019 15:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=jFt4mIQy1/O4uoE84B2MhzTmYMLv4QygP6QDFf40fuQ=;
 b=EDb1jtDchfffmJze0Lt8tH5m7kHNmpLoMsXWp4p2hmcQw+2mj7RUFssNn/rDaml7VO
 6uNRA64/g2h68bdwPCSCS3uaGIiCsLOBe3VOZTFHwogXojummcEQoQw6HbVYbuJveAxK
 xrmeSINhxYSgQ5tJS2UqZngT3lTJ2jwVHbrbqbOti/wKpzc6HG2Xfb4By41zHESaT+/n
 eKg7uOOu/G0bQ6yiuho9ZCMo40NrVjrR+htHxJsvPDYvTtM1GmCCfktAEGXUb53QGVcX
 MR9TDClO/JqZMaygj7Cgadkc5+gaTVLeHfyTwA/kj/juDQBeptZOGcLVTJ6wFyHo+NYk
 FZMg==
X-Gm-Message-State: APjAAAX9oS5N5lNCDUcaFI/nsw+8oO3jfWOhItWTTrcb+Nuhi6UHDC3K
 VWpoS+hzqNaWb+eLxrF0KbP5hggKTSmn/XFqLvkLzz65calUpbttxCcfeDS+GegWpyf/3W93Ax9
 Wmy1u/xIfOlfwmANbrC4zBRXWUA==
X-Received: by 2002:ae9:ea12:: with SMTP id f18mr6926287qkg.204.1568847318675; 
 Wed, 18 Sep 2019 15:55:18 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQ3ACJZe95EAfbPmoGm0THV9YqDxfIjUanCv23y4L0WIPEzjabopn9fPmJzelkUOsbnBAueg==
X-Received: by 2002:ae9:ea12:: with SMTP id f18mr6926274qkg.204.1568847318392; 
 Wed, 18 Sep 2019 15:55:18 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id u27sm3090917qta.90.2019.09.18.15.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Sep 2019 15:55:17 -0700 (PDT)
Message-ID: <098b7e1d4d4491cc7735cb26b499fbc304dc4e24.camel@redhat.com>
Subject: Re: [PATCH 01/15] drm/amdgpu: Add encoder atomic check
From: Lyude Paul <lyude@redhat.com>
To: mikita.lipski@amd.com, amd-gfx@lists.freedesktop.org
Date: Wed, 18 Sep 2019 18:55:16 -0400
In-Reply-To: <0dba0e8b72c146cc1d27c8895b1c732e719fc371.1568833906.git.mikita.lipski@amd.com>
References: <cover.1568833906.git.mikita.lipski@amd.com>
 <0dba0e8b72c146cc1d27c8895b1c732e719fc371.1568833906.git.mikita.lipski@amd.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: rRFRg54KORmsGP_wiUxaFA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1568847689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DVc86wjMdbNfYRWDFI1PvE0SxScOyKcl4HDBra1o93Y=;
 b=cSzqpjQY2rRCyINT8OzMU1ErNn+fzwJtDwDpLQj+WIzHQ34wANcnuS1NZlEhGFEuh262Xv
 OYC7CTIdBHlANigj/sPHo9PzcMsZF8yWuQfJRjM3etihY5OzHVKdrHdJDL0Bz0dHd9fzTu
 2B2lcFnulIn6McxIniHliEgpYoDQJ8U=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

SGF2ZW4ndCBsb29rZWQgYXQgdGhlc2UgcXVpdGUgeWV0LCBidXQgSSBqdXN0IHdhbnRlZCB0byBz
YXkgYWhlYWQgb2YgdGltZSB0aGF0CmZyb20gYSBxdWljayBnbGFuY2UgdGhlc2UgbG9vayBsaWtl
IGEgYmlnIHN0ZXAgaW4gdGhlIHJpZ2h0IGRpcmVjdGlvbiA6KS4KQXdlc29tZSB3b3JrIQoKSSB3
aWxsIHJldmlldyB0aGlzIEFTQVAgCgpPbiBXZWQsIDIwMTktMDktMTggYXQgMTY6MjYgLTA0MDAs
IG1pa2l0YS5saXBza2lAYW1kLmNvbSB3cm90ZToKPiBGcm9tOiBNaWtpdGEgTGlwc2tpIDxtaWtp
dGEubGlwc2tpQGFtZC5jb20+Cj4gCj4gW3doeV0KPiBJbiBvcmRlciB0byBjb21wbHkgd2l0aCBu
ZXcgTVNUIGF0b21pYyBjaGVjawo+IHdlIGhhdmUgdG8gZmluZCBhbmQgYWRkIFZDUEkgc2xvdHMg
dG8gdGhlIHN0YXRlCj4gZHVyaW5nIGF0b21pYyBjaGVjayB3aGVuZXZlciB0aGVpciBpcyBhIGNo
YW5nZSBvbgo+IG1vZGUgb3IgY29ubmVjdG9yLgo+IFtob3ddCj4gLSBWZXJpZnkgdGhhdCBpdCBp
cyBhIE1TVCBjb25uZWN0aW9uCj4gLSBDb252ZXJ0IG5ldyBzdHJlYW0ncyBjbG9jayBhbmQgYnBw
Cj4gLSBDYWxjdWxhdGUgUEJOIGJhc2VkIG9uIHN0cmVhbSBwYXJhbWV0ZXJzCj4gLSBGaW5kIGFu
ZCBhZGQgVkNQSSBzbG90cyB0byB0aGUgc3RhdGUKPiAKPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNaWtpdGEgTGlwc2tpIDxtaWtpdGEubGlwc2tp
QGFtZC5jb20+Cj4gLS0tCj4gIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRn
cHVfZG0uYyB8IDU5ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDU5IGlu
c2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Ft
ZGdwdV9kbS9hbWRncHVfZG0uYwo+IGluZGV4IDdiMGNhMmUxZWQ4Yi4uZDcwMGI5NjJkMzM4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1
X2RtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCj4gQEAgLTQ0MzIsNiArNDQzMiw2NSBAQCBzdGF0aWMgaW50IGRtX2VuY29kZXJfaGVs
cGVyX2F0b21pY19jaGVjayhzdHJ1Y3QKPiBkcm1fZW5jb2RlciAqZW5jb2RlciwKPiAgCQkJCQkg
IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKPiAgCQkJCQkgIHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlCj4gKmNvbm5fc3RhdGUpCj4gIHsKPiArCXN0cnVjdCBkcm1fYXRvbWlj
X3N0YXRlICpzdGF0ZSA9IGNydGNfc3RhdGUtPnN0YXRlOwo+ICsJc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciA9IGNvbm5fc3RhdGUtPmNvbm5lY3RvcjsKPiArCXN0cnVjdCBhbWRncHVf
ZG1fY29ubmVjdG9yICphY29ubmVjdG9yID0KPiB0b19hbWRncHVfZG1fY29ubmVjdG9yKGNvbm5l
Y3Rvcik7Cj4gKwlzdHJ1Y3QgZG1fY3J0Y19zdGF0ZSAqZG1fbmV3X2NydGNfc3RhdGUgPQo+IHRv
X2RtX2NydGNfc3RhdGUoY3J0Y19zdGF0ZSk7Cj4gKwljb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlf
bW9kZSAqYWRqdXN0ZWRfbW9kZSA9ICZjcnRjX3N0YXRlLQo+ID5hZGp1c3RlZF9tb2RlOwo+ICsJ
c3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfbWdyICptc3RfbWdyOwo+ICsJc3RydWN0IGRybV9k
cF9tc3RfcG9ydCAqbXN0X3BvcnQ7Cj4gKwlpbnQgcGJuLCBzbG90cyxjbG9jaywgYnBwID0gMDsK
PiArCj4gKwlpZiAoIWRtX25ld19jcnRjX3N0YXRlKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCWlm
ICghYWNvbm5lY3RvciB8fCAhYWNvbm5lY3Rvci0+cG9ydCkKPiArCQlyZXR1cm4gMDsKPiArCj4g
Kwltc3RfcG9ydCA9IGFjb25uZWN0b3ItPnBvcnQ7Cj4gKwltc3RfbWdyID0gJmFjb25uZWN0b3It
Pm1zdF9wb3J0LT5tc3RfbWdyOwo+ICsKPiArCWlmICghbXN0X21nci0+bXN0X3N0YXRlKQo+ICsJ
CXJldHVybiAwOwo+ICsKPiArCWlmICghY3J0Y19zdGF0ZS0+Y29ubmVjdG9yc19jaGFuZ2VkICYm
ICFjcnRjX3N0YXRlLT5tb2RlX2NoYW5nZWQpCj4gKwkJcmV0dXJuIDA7Cj4gKwo+ICsJc3dpdGNo
IChjb252ZXJ0X2NvbG9yX2RlcHRoX2Zyb21fZGlzcGxheV9pbmZvKGNvbm5lY3RvciwgY29ubl9z
dGF0ZSkpCj4gewo+ICsJY2FzZSBDT0xPUl9ERVBUSF82NjY6Cj4gKwkJYnBwID0gNjsKPiArCQli
cmVhazsKPiArCWNhc2UgQ09MT1JfREVQVEhfODg4Ogo+ICsJCWJwcCA9IDg7Cj4gKwkJYnJlYWs7
Cj4gKwljYXNlIENPTE9SX0RFUFRIXzEwMTAxMDoKPiArCQlicHAgPSAxMDsKPiArCQlicmVhazsK
PiArCWNhc2UgQ09MT1JfREVQVEhfMTIxMjEyOgo+ICsJCWJwcCA9IDEyOwo+ICsJCWJyZWFrOwo+
ICsJY2FzZSBDT0xPUl9ERVBUSF8xNDE0MTQ6Cj4gKwkJYnBwID0gMTQ7Cj4gKwkJYnJlYWs7Cj4g
KwljYXNlIENPTE9SX0RFUFRIXzE2MTYxNjoKPiArCQlicHAgPSAxNjsKPiArCQlicmVhazsKPiAr
CWRlZmF1bHQ6Cj4gKwkJQVNTRVJUKGJwcCAhPSAwKTsKPiArCQlicmVhazsKPiArCX0KPiArCj4g
KwlicHAgKj0gMzsKPiArCWNsb2NrID0gYWRqdXN0ZWRfbW9kZS0+Y2xvY2s7Cj4gKwlwYm4gPSBk
cm1fZHBfY2FsY19wYm5fbW9kZShjbG9jaywgYnBwKTsKPiArCXNsb3RzID0gZHJtX2RwX2F0b21p
Y19maW5kX3ZjcGlfc2xvdHMoc3RhdGUsCj4gKwkJCQkJCW1zdF9tZ3IsCj4gKwkJCQkJCW1zdF9w
b3J0LAo+ICsJCQkJCQlwYm4pOwo+ICsJaWYgKHNsb3RzIDwgMCkgewo+ICsJCURSTV9ERUJVR19L
TVMoImZhaWxlZCBmaW5kaW5nIHZjcGkgc2xvdHM6JWRcbiIsIHNsb3RzKTsKPiArCQlyZXR1cm4g
c2xvdHM7Cj4gKwl9Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKLS0gCkNoZWVycywKCUx5dWRlIFBh
dWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1n
ZnggbWFpbGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
