Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797F103641
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Nov 2019 09:57:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96BFB6E0EF;
	Wed, 20 Nov 2019 08:57:21 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8396E0EF
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 08:57:19 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id l17so6109070wmh.0
 for <amd-gfx@lists.freedesktop.org>; Wed, 20 Nov 2019 00:57:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=veCynJZKC5IdOXgtWDYm4ofVazUQvM6DeDbiwbDvz44=;
 b=m3WFvFt7sjhtGRk2uZFIfiX71JVo/Fxa2xx8krVdRrbCL761LDraDWa9LImoIwpHYk
 G5vO0k6M4e0uzYIDge8CgnlNsS7ovpPNZAw8lDfPDVosYS1oe9bMDtOvzsRaZq6hgkw8
 aW+J5N4eIkhsAFZ9rSnuY9CZ+uKDIV2tA1phfZqJ6ZCMqN7LEwP6ugrNyUo74Z+MLwAm
 Oseatpt3Na4kn99n+3WpEE5+BVQDcO69aD8zTmCJfXPHwfJHAcl7dSFqfXfef2MBELDd
 8HGnJdSVRG9qwYjwH1jhqcVcimHL8qsTY9ibcyYT9M79yCV5Lk6LEIeh6WjNPkzQI2DH
 rDnA==
X-Gm-Message-State: APjAAAWkQf/4l0k6Wxf3yHTxHhGROP4LE1eJQ5bzk/rX0L1KMCcLhfia
 +XMD4Khy3VtkjsscdHN0BQ9KvHEk
X-Google-Smtp-Source: APXvYqzAV4FZlI2u9exfx1Mr865+H5R/RAU8JiTX5RI6DYSZ5aEQxdLrtvoFOcaqOj8Mr8adNgFbnA==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr1861352wmb.102.1574240237939; 
 Wed, 20 Nov 2019 00:57:17 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j66sm5583109wma.19.2019.11.20.00.57.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Nov 2019 00:57:17 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu/gfx10: re-init clear state buffer after gpu
 reset
To: "Zhang, Hawking" <Hawking.Zhang@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Yuan, Xiaojie" <Xiaojie.Yuan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20191120064701.2765-1-xiaojie.yuan@amd.com>
 <DM5PR12MB1418A32EB8199ABFFCCAEC04FC4F0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <DM5PR12MB14185B32B9CB4356233E5903FC4F0@DM5PR12MB1418.namprd12.prod.outlook.com>
 <01af7844-2fbe-fd1a-5662-c8a9ec5812f0@gmail.com>
 <DM5PR12MB141866D265D123D18E289329FC4F0@DM5PR12MB1418.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7bac41bc-c672-0a16-c3f0-003b8c3f0777@gmail.com>
Date: Wed, 20 Nov 2019 09:57:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <DM5PR12MB141866D265D123D18E289329FC4F0@DM5PR12MB1418.namprd12.prod.outlook.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=veCynJZKC5IdOXgtWDYm4ofVazUQvM6DeDbiwbDvz44=;
 b=Uy/igybf1+v/mmd2psdJCDVtgrMiG2S5ZxvVsvG0b1oYc+3SWpLpPErqdkR6AAA76w
 45l+fai+KqUyIEPoRqwylcAOd605zk4ZaZ7B0oYQDeusd6ZMeq0LriVC+lZPWvlquNlG
 d9Iae8g3sj27hDIEzPdN0rw0oX0uiZnXODgJl+k5NpUqeekTdNXRy9Fm+UvZ398igaOT
 TXkhRjLK1EVned4DAtyBT1CbahAeQlucVuEs93kEQKLn8/TssRnU+UeJDQw9sB5N6bzu
 BgYG24p8bU3I9kD75/CobC9mrlEtYUniemKKHmw9Zy7PibiTW/ARJ6X/3OLvsoQ0B3FR
 cUNw==
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
Cc: "Long, Gang" <Gang.Long@amd.com>, "Xiao, Jack" <Jack.Xiao@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

V2hpbGUgdGhlIEdQVSBpcyBsb2NrZWQgdXA/IE5vdCBhIGdvb2QgaWRlYSBhdCBhbGwsIHdlIG5l
ZWQgdGhlIFNETUEgZm9yIAp0aGlzIGFuZCB0aGF0IHdvdWxkIGJlIHJhdGhlciB1bnJlbGlhYmxl
LgoKSWYgdGhlIGNvbnRlbnQgb2YgdGhlIEJPIGlzIGNvbnN0YW50IHdlIHNob3VsZCBqdXN0IHJl
LWluaXRpYWxpemUgaXQgCmFmdGVyIHRoZSByZXNldC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCkFt
IDIwLjExLjE5IHVtIDA5OjU0IHNjaHJpZWIgWmhhbmcsIEhhd2tpbmc6Cj4gSSB0aGluayB3ZSBz
aG91bGQgZXZpY3QgdGhlIGJvIGFuZCB0aGVuIG1vdmUgaXQgYmFjay4KPgo+IFJlZ2FyZHMsCj4g
SGF3a2luZwo+Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPiBGcm9tOiBDaHJpc3RpYW4g
S8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT4KPiBTZW50OiAyMDE55bm0
MTHmnIgyMOaXpSAxNjo0Nwo+IFRvOiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQu
Y29tPjsgWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IENjOiBMb25nLCBHYW5nIDxHYW5nLkxvbmdAYW1kLmNvbT47IFhp
YW8sIEphY2sgPEphY2suWGlhb0BhbWQuY29tPgo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9h
bWRncHUvZ2Z4MTA6IHJlLWluaXQgY2xlYXIgc3RhdGUgYnVmZmVyIGFmdGVyIGdwdSByZXNldAo+
Cj4gQSBiYWNvIHJlc2V0IGFsc28gcmVzZXRzIHRoZSBNQywgZG9lc24ndCBpdD8gbiB0aGlzIGNh
c2UgaXQgd291bGQgYmUgZXhwZWN0ZWQgdGhhdCB0aGUgY29udGVudCBvZiBWUkFNIGlzIGNvcnJ1
cHRlZC4KPgo+IENocmlzdGlhbi4KPgo+IEFtIDIwLjExLjE5IHVtIDA5OjQ1IHNjaHJpZWIgWmhh
bmcsIEhhd2tpbmc6Cj4+IE9yIGluIGFub3RoZXIgd29yZCwgd2UgYXJlIHN0aWxsIG5vdCBjbGVh
ciB3aGVuIHRoZSBjb3JydXB0aW9uIGFjdHVhbGx5IGhhcHBlbnMsIHJpZ2h0Pwo+Pgo+PiBSZWdh
cmRzLAo+PiBIYXdraW5nCj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGFt
ZC1nZnggPGFtZC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBP
Zgo+PiBaaGFuZywgSGF3a2luZwo+PiBTZW50OiAyMDE55bm0MTHmnIgyMOaXpSAxNjo0NAo+PiBU
bzogWXVhbiwgWGlhb2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+Owo+PiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogTG9uZywgR2FuZyA8R2FuZy5Mb25nQGFtZC5jb20+OyBY
aWFvLCBKYWNrIDxKYWNrLlhpYW9AYW1kLmNvbT4KPj4gU3ViamVjdDogUkU6IFtQQVRDSF0gZHJt
L2FtZGdwdS9nZngxMDogcmUtaW5pdCBjbGVhciBzdGF0ZSBidWZmZXIKPj4gYWZ0ZXIgZ3B1IHJl
c2V0Cj4+Cj4+IEp1c3QgbWFrZSBzdXJlIEkgdW5kZXJzdGFuZCB5b3UgY29ycmVjdGx5LiBTbyB1
bnRpbCBmdyB0ZWFtIHJvb3QgY2F1c2UgdGhlIHJlYXNvbiBvZiBjc2IgY29ycnVwdGlvbiwgd2Ug
a2VlcCB0aGUgd29ya2Fyb3VuZCBpbiBkcml2ZXIsIGNvcnJlY3Q/Cj4+Cj4+IFJlZ2FyZHMsCj4+
IEhhd2tpbmcKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogWXVhbiwgWGlh
b2ppZSA8WGlhb2ppZS5ZdWFuQGFtZC5jb20+Cj4+IFNlbnQ6IDIwMTnlubQxMeaciDIw5pelIDE0
OjQ3Cj4+IFRvOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogWmhhbmcsIEhh
d2tpbmcgPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IFhpYW8sIEphY2sKPj4gPEphY2suWGlhb0Bh
bWQuY29tPjsgTG9uZywgR2FuZyA8R2FuZy5Mb25nQGFtZC5jb20+OyBZdWFuLCBYaWFvamllCj4+
IDxYaWFvamllLll1YW5AYW1kLmNvbT4KPj4gU3ViamVjdDogW1BBVENIXSBkcm0vYW1kZ3B1L2dm
eDEwOiByZS1pbml0IGNsZWFyIHN0YXRlIGJ1ZmZlciBhZnRlcgo+PiBncHUgcmVzZXQKPj4KPj4g
VGhpcyBwYXRjaCBmaXhlcyAybmQgYmFjbyByZXNldCBmYWlsdXJlIHdpdGggZ2Z4b2ZmIGVuYWJs
ZWQgb24gbmF2aTF4Lgo+Pgo+PiBjbGVhciBzdGF0ZSBidWZmZXIgKHJlc2lkZXMgaW4gdnJhbSkg
aXMgY29ycnVwdGVkIGFmdGVyIDFzdCBiYWNvIHJlc2V0LCB1cG9uIGdmeG9mZiBleGl0LCBDUEYg
Z2V0cyBnYXJiYWdlIGhlYWRlciBpbiBDU0lCIGFuZCBoYW5ncy4KPj4KPj4gU2lnbmVkLW9mZi1i
eTogWGlhb2ppZSBZdWFuIDx4aWFvamllLnl1YW5AYW1kLmNvbT4KPj4gLS0tCj4+ICAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jIHwgNDMgKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KPj4gICAgMSBmaWxlIGNoYW5nZWQsIDM3IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2dmeF92MTBfMC5jCj4+IGlu
ZGV4IDkyNzRiZDRiNmM2OC4uOGUyNGVhMDhjYTM5IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9nZnhfdjEwXzAuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9nZnhfdjEwXzAuYwo+PiBAQCAtMTc4OSwyNyArMTc4OSw1MiBAQCBzdGF0aWMgdm9p
ZCBnZnhfdjEwXzBfZW5hYmxlX2d1aV9pZGxlX2ludGVycnVwdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwKPj4gICAgCVdSRUczMl9TT0MxNShHQywgMCwgbW1DUF9JTlRfQ05UTF9SSU5HMCwg
dG1wKTsgIH0KPj4gICAgCj4+IC1zdGF0aWMgdm9pZCBnZnhfdjEwXzBfaW5pdF9jc2Ioc3RydWN0
IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICtzdGF0aWMgaW50IGdmeF92MTBfMF9pbml0X2NzYihz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gICAgewo+PiArCWludCByOwo+PiArCj4+ICsJ
aWYgKGFkZXYtPmluX2dwdV9yZXNldCkgewo+PiArCQlyID0gYW1kZ3B1X2JvX3Jlc2VydmUoYWRl
di0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmosIGZhbHNlKTsKPj4gKwkJaWYgKHIpCj4+ICsJCQly
ZXR1cm4gcjsKPj4gKwo+PiArCQlyID0gYW1kZ3B1X2JvX2ttYXAoYWRldi0+Z2Z4LnJsYy5jbGVh
cl9zdGF0ZV9vYmosCj4+ICsJCQkJICAgKHZvaWQgKiopJmFkZXYtPmdmeC5ybGMuY3NfcHRyKTsK
Pj4gKwkJaWYgKCFyKSB7Cj4+ICsJCQlhZGV2LT5nZngucmxjLmZ1bmNzLT5nZXRfY3NiX2J1ZmZl
cihhZGV2LAo+PiArCQkJCQlhZGV2LT5nZngucmxjLmNzX3B0cik7Cj4+ICsJCQlhbWRncHVfYm9f
a3VubWFwKGFkZXYtPmdmeC5ybGMuY2xlYXJfc3RhdGVfb2JqKTsKPj4gKwkJfQo+PiArCj4+ICsJ
CWFtZGdwdV9ib191bnJlc2VydmUoYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0ZV9vYmopOwo+PiAr
CQlpZiAocikKPj4gKwkJCXJldHVybiByOwo+PiArCX0KPj4gKwo+PiAgICAJLyogY3NpYiAqLwo+
PiAgICAJV1JFRzMyX1NPQzE1KEdDLCAwLCBtbVJMQ19DU0lCX0FERFJfSEksCj4+ICAgIAkJICAg
ICBhZGV2LT5nZngucmxjLmNsZWFyX3N0YXRlX2dwdV9hZGRyID4+IDMyKTsKPj4gICAgCVdSRUcz
Ml9TT0MxNShHQywgMCwgbW1STENfQ1NJQl9BRERSX0xPLAo+PiAgICAJCSAgICAgYWRldi0+Z2Z4
LnJsYy5jbGVhcl9zdGF0ZV9ncHVfYWRkciAmIDB4ZmZmZmZmZmMpOwo+PiAgICAJV1JFRzMyX1NP
QzE1KEdDLCAwLCBtbVJMQ19DU0lCX0xFTkdUSCwKPj4gYWRldi0+Z2Z4LnJsYy5jbGVhcl9zdGF0
ZV9zaXplKTsKPj4gKwo+PiArCXJldHVybiAwOwo+PiAgICB9Cj4+ICAgIAo+PiAtc3RhdGljIHZv
aWQgZ2Z4X3YxMF8wX2luaXRfcGcoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4+ICtzdGF0
aWMgaW50IGdmeF92MTBfMF9pbml0X3BnKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+PiAg
ICB7Cj4+ICAgIAlpbnQgaTsKPj4gKwlpbnQgcjsKPj4gICAgCj4+IC0JZ2Z4X3YxMF8wX2luaXRf
Y3NiKGFkZXYpOwo+PiArCXIgPSBnZnhfdjEwXzBfaW5pdF9jc2IoYWRldik7Cj4+ICsJaWYgKHIp
Cj4+ICsJCXJldHVybiByOwo+PiAgICAKPj4gICAgCWZvciAoaSA9IDA7IGkgPCBhZGV2LT5udW1f
dm1odWJzOyBpKyspCj4+ICAgIAkJYW1kZ3B1X2dtY19mbHVzaF9ncHVfdGxiKGFkZXYsIDAsIGks
IDApOwo+PiAgICAKPj4gICAgCS8qIFRPRE86IGluaXQgcG93ZXIgZ2F0aW5nICovCj4+IC0JcmV0
dXJuOwo+PiArCXJldHVybiAwOwo+PiAgICB9Cj4+ICAgIAo+PiAgICB2b2lkIGdmeF92MTBfMF9y
bGNfc3RvcChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikgQEAgLTE5MTEsNyArMTkzNiwxMCBA
QCBzdGF0aWMgaW50IGdmeF92MTBfMF9ybGNfcmVzdW1lKHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQo+PiAgICAJCXIgPSBnZnhfdjEwXzBfd2FpdF9mb3JfcmxjX2F1dG9sb2FkX2NvbXBsZXRl
KGFkZXYpOwo+PiAgICAJCWlmIChyKQo+PiAgICAJCQlyZXR1cm4gcjsKPj4gLQkJZ2Z4X3YxMF8w
X2luaXRfcGcoYWRldik7Cj4+ICsKPj4gKwkJciA9IGdmeF92MTBfMF9pbml0X3BnKGFkZXYpOwo+
PiArCQlpZiAocikKPj4gKwkJCXJldHVybiByOwo+PiAgICAKPj4gICAgCQkvKiBlbmFibGUgUkxD
IFNSTSAqLwo+PiAgICAJCWdmeF92MTBfMF9ybGNfZW5hYmxlX3NybShhZGV2KTsKPj4gQEAgLTE5
MzcsNyArMTk2NSwxMCBAQCBzdGF0aWMgaW50IGdmeF92MTBfMF9ybGNfcmVzdW1lKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2KQo+PiAgICAJCQkJcmV0dXJuIHI7Cj4+ICAgIAkJfQo+PiAgICAK
Pj4gLQkJZ2Z4X3YxMF8wX2luaXRfcGcoYWRldik7Cj4+ICsJCXIgPSBnZnhfdjEwXzBfaW5pdF9w
ZyhhZGV2KTsKPj4gKwkJaWYgKHIpCj4+ICsJCQlyZXR1cm4gcjsKPj4gKwo+PiAgICAJCWFkZXYt
PmdmeC5ybGMuZnVuY3MtPnN0YXJ0KGFkZXYpOwo+PiAgICAKPj4gICAgCQlpZiAoYWRldi0+Zmly
bXdhcmUubG9hZF90eXBlID09IEFNREdQVV9GV19MT0FEX1JMQ19CQUNLRE9PUl9BVVRPKQo+PiB7
Cj4+IC0tCj4+IDIuMjAuMQo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+PiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2FtZC1nZngKPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9hbWQtZ2Z4Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4
IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
