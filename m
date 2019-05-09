Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B9F18846
	for <lists+amd-gfx@lfdr.de>; Thu,  9 May 2019 12:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3EC893EC;
	Thu,  9 May 2019 10:25:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-it1-x136.google.com (mail-it1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCCC6893EC
 for <amd-gfx@lists.freedesktop.org>; Thu,  9 May 2019 10:25:05 +0000 (UTC)
Received: by mail-it1-x136.google.com with SMTP id m141so1302410ita.3
 for <amd-gfx@lists.freedesktop.org>; Thu, 09 May 2019 03:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kylLHXgfvTQo4USxv4cr4vT/MZh/rNTswFj4KEK4kAg=;
 b=gGWaWB8CQlbzqxJQzGbC0lzIEVNuy7W3J/QlivD4H65oo6m/OC7kimo1jmmovwaXVY
 1ULBCIb8fhDF0g5V/HzxTSVLH3QKZkr0PnOUvx9n5eY9PMc5kwER/34Hxar9HmexHaGY
 ZjxPWrjrbP6xm9SzFmYcs4XErkVqpWB83sfB5yAXdOwuK5XlmE9HWeYe5bC+uxMTJsKf
 9os+vXgzZS8zlmzbEa2RVYImBdGQGM7iwa4SQ72iFZEOd7/o+dHCVBILD/U4UDXU58ZK
 MvDYeoXL5n6FDPQYViTi3dDtIWaKYSQJCVPyXY8WgwMYDWVJSZKNjDVORjW3HuHrRn61
 Mq2w==
X-Gm-Message-State: APjAAAWTSCJDuLvC0KI/vCNIlkYo36y+OUnUHQrw3Rgf36j/ZrSscH5h
 bUqhd93TUHicKte7VNJUXLHX7v1DkyNPl3fupva+Dm3z4a4=
X-Google-Smtp-Source: APXvYqxiDEeKcnBR4hSq5ccRlqvas4vmZJ6nqpVbggXg6rrWsC3Fx3V1XJdPNO/kUVbCdMxapFGN/9VfGprcuOpcLEw=
X-Received: by 2002:a24:e519:: with SMTP id g25mr2374605iti.7.1557397504982;
 Thu, 09 May 2019 03:25:04 -0700 (PDT)
MIME-Version: 1.0
References: <CABXGCsMY=LvtCp0V8U8jbARXgapjQe4WP9ss-ui3fHsPQjevXg@mail.gmail.com>
 <98231ce0-f29c-df52-1ba3-c9f85a76bcac@gmail.com>
 <CABXGCsOXEWS5fUrQZQf0qdH6Wn=h5BC9cPaoQk8hYhvW-nm6AA@mail.gmail.com>
 <58827d68-cc9a-4a37-f078-7aec9b6a98cd@gmail.com>
 <CABXGCsPcfyvHqhhGYAgnA-FoQ5zRovu7NP7GMiGBvrqwoe5ahA@mail.gmail.com>
 <6cc00e3e-1915-4257-305a-00d8c9e3383d@amd.com>
In-Reply-To: <6cc00e3e-1915-4257-305a-00d8c9e3383d@amd.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Thu, 9 May 2019 15:24:53 +0500
Message-ID: <CABXGCsO9T9sEtVZ8Z9S3e0HAjBokaD-280x4gePCQMaPWwvzqg@mail.gmail.com>
Subject: Re: How to dump gfx and waves after GPU reset happened?
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=kylLHXgfvTQo4USxv4cr4vT/MZh/rNTswFj4KEK4kAg=;
 b=nDnaVRY2jNGLxv+77IGj5zmc5Qi9+W0esAMV6xc9X6fnYm554wgwrYgUtkc06MmWU0
 qdtD6zn1q5qj+vOJu7It9jiiUzJrhn5hI9aXYia73OpWl4JMj6gzOn1t4DGxT7L8phEF
 RNLXQwbOCpUCfyXHrH68d2NIPtR2qkapvwJJCLWdeJdZdPZFrP0AgUqJJOhyjsEMDQrE
 po8GQcYXe+KaB1RRqecfzeBM92t+ZsK9+oXWd1RTEDCntGTP/lrhAmfwso16brOwdhuE
 eQB/EcA+jXgoRX6+Q7tyIkECeuCPaPPmrXXpdpTn/HlvAkR3mL05Rwo72F99Bq/rDgtW
 244A==
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
Cc: "StDenis, Tom" <Tom.StDenis@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCA2IE1heSAyMDE5IGF0IDE3OjM0LCBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFu
LktvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IFRoYXQgd29uJ3Qgd29yay4gVGhlIGtlcm5lbCBj
YW4ndCB3YWl0IGZvciBzcGF3bmVkIHByb2Nlc3NlcyB0byBmaW5pc2gKPiBiZWNhdXNlIGl0IGlz
IGhvbGRpbmcgbG9ja3MuCj4KPiBUaGUgc2NyaXB0IGNvdWxkIGFzIGxhc3Qgb3BlcmF0aW9uIHRy
aWdnZXIgYSBtYW51YWwgcmVzZXQsIGJ1dCB0aGF0Cj4gd291bGQgbm90IGJlIHRoZSBzYW1lIGFz
IGEgdGltZW91dCByZXNldCBiZWNhdXNlIHlvdSBkb24ndCBrbm93IHRoZQo+IGNhdXNlIG9mIGl0
IGFuZCB3b3VsZCBhbHdheXMgbmVlZCB0byBkbyBhIGZ1bGwgZW5naW5lIHJlc2V0Lgo+Cj4gU29y
cnksIGJ1dCB3aGF0IHlvdSBhcmUgc3VnZ2VzdGluZyBoZXJlIChjb2xsZWN0IGRhdGEgYW5kIHRo
ZW4gcmVzZXQpIGlzCj4gbm90IGVhc2lseSBkb2FibGUuCj4KCkkgYW0gdW5kZXJzdGFuZCwgYnV0
IEkgYW0gcmVhbGx5IGxpa2VkIGhvdyBpdCBpbXBsZW1lbnRlZCBpbiBpbnRlbCBkcml2ZXIuCkZv
ciBleGFtcGxlIGFmdGVyIGdwdSBoYW5nIGFsbCBkZWJ1ZyBkYXRhIGF2YWlsYWJsZSBieSBwYXRo
Ci9zeXMvY2xhc3MvZHJtL2NhcmQwL2Vycm9yCgpbICA1MTIuMjk2NzU2XSBpOTE1IDAwMDA6MDA6
MDIuMDogR1BVIEhBTkc6IGVjb2RlIDc6MToweGZmZmZmZmZlLCBpbgpnbm9tZS1zaGVsbCBbMTc1
M10sIGhhbmcgb24gcmNzMApbICA1MTIuMjk2NzYxXSBbZHJtXSBHUFUgaGFuZ3MgY2FuIGluZGlj
YXRlIGEgYnVnIGFueXdoZXJlIGluIHRoZQplbnRpcmUgZ2Z4IHN0YWNrLCBpbmNsdWRpbmcgdXNl
cnNwYWNlLgpbICA1MTIuMjk2NzYyXSBbZHJtXSBQbGVhc2UgZmlsZSBhIF9uZXdfIGJ1ZyByZXBv
cnQgb24KYnVncy5mcmVlZGVza3RvcC5vcmcgYWdhaW5zdCBEUkkgLT4gRFJNL0ludGVsClsgIDUx
Mi4yOTY3NjNdIFtkcm1dIGRybS9pOTE1IGRldmVsb3BlcnMgY2FuIHRoZW4gcmVhc3NpZ24gdG8g
dGhlCnJpZ2h0IGNvbXBvbmVudCBpZiBpdCdzIG5vdCBhIGtlcm5lbCBpc3N1ZS4KWyAgNTEyLjI5
Njc2NF0gW2RybV0gVGhlIGdwdSBjcmFzaCBkdW1wIGlzIHJlcXVpcmVkIHRvIGFuYWx5emUgZ3B1
CmhhbmdzLCBzbyBwbGVhc2UgYWx3YXlzIGF0dGFjaCBpdC4KWyAgNTEyLjI5Njc2Nl0gW2RybV0g
R1BVIGNyYXNoIGR1bXAgc2F2ZWQgdG8gL3N5cy9jbGFzcy9kcm0vY2FyZDAvZXJyb3IKWyAgNTEy
LjI5Njg3NV0gaTkxNSAwMDAwOjAwOjAyLjA6IFJlc2V0dGluZyBjaGlwIGZvciBoYW5nIG9uIHJj
czAKWyAgNTYzLjI4MDk2MF0gaTkxNSAwMDAwOjAwOjAyLjA6IFJlc2V0dGluZyBjaGlwIGZvciBo
YW5nIG9uIHJjczAKWyAgNTcxLjI4MTY2Nl0gaTkxNSAwMDAwOjAwOjAyLjA6IFJlc2V0dGluZyBj
aGlwIGZvciBoYW5nIG9uIHJjczAKCgotLQpCZXN0IFJlZ2FyZHMsCk1pa2UgR2F2cmlsb3YuCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFp
bGluZyBsaXN0CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeA==
