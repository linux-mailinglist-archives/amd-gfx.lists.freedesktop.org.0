Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F78D8EBE
	for <lists+amd-gfx@lfdr.de>; Wed, 16 Oct 2019 12:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65DB06E082;
	Wed, 16 Oct 2019 10:58:11 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236B86E082
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 10:58:10 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i16so2405648wmd.3
 for <amd-gfx@lists.freedesktop.org>; Wed, 16 Oct 2019 03:58:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=2A9wFLe040VxmN1yB9P1AZhAEqxHA2EQTAJ/L4EwMug=;
 b=VnwLDUvIsF5KydMVg4AZAJUhBSvnX2aTVhlZxlyw1foyJCfS38UWyo3UA05EpPCv4B
 6faIayuYuSjIlYiPvTaLkU1SsTPOpe3Sd/V9AvG1HP9HpNrAIiZ7qRXeb7wzRAwsgB7C
 cyneDiQp/hJVgn1JJQk1mF4qcgeGLIY8pXWJDtXLjJAyon3YBeXKMEQLFuzgfIhjlxOF
 +10gc3eDps53fxAsKw0TFcWLDuX8UFcPkwQjcnV+DhLXMreXZGhwTNifq+mjcB0P98KQ
 VTqrWd813P41w0GTFw3rBNv2xRP1//JHMfNE7b33EifJghuWri6Qnfchvvw4UmK4j437
 xCXA==
X-Gm-Message-State: APjAAAWNGwakzvfB2efatcDHu5k1s7NoeiUBWGD1zkOYt5Md8k/UYJK0
 E224V7Xspt2eBUMu+My69YxQ4KHD
X-Google-Smtp-Source: APXvYqx5iynsNN30aUJ1ZwIE+GlorerWaQJA8KV4wOexsuhxS0ssX1OsrTsnKbFB7JDd8sLspa0qLg==
X-Received: by 2002:a7b:c3d2:: with SMTP id t18mr2992066wmj.66.1571223488485; 
 Wed, 16 Oct 2019 03:58:08 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id o9sm35259116wrh.46.2019.10.16.03.58.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Oct 2019 03:58:07 -0700 (PDT)
Subject: Re: TTM refcount problem.
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 "Koenig, Christian" <christian.koenig@amd.com>
References: <CAP+8YyHjrmUXp7c1bR931WG8EyOwAUAZhw-=V0C3DORGq4Fp5A@mail.gmail.com>
 <acbe47bd-167c-7761-8534-d554cf2ef8f7@gmail.com>
 <CAP+8YyFBY_sKN99n9fp7dYEbACCYjmbg+Niutq_bXid8H0X42w@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6b3e3172-ccda-d5fe-5abc-b49100bd7171@gmail.com>
Date: Wed, 16 Oct 2019 12:58:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAP+8YyFBY_sKN99n9fp7dYEbACCYjmbg+Niutq_bXid8H0X42w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=2A9wFLe040VxmN1yB9P1AZhAEqxHA2EQTAJ/L4EwMug=;
 b=B0iO3K76HUsWT+pHtujB15leUIvtdRLtqENl0Syv+oOmpr5p8bj7GMHUvwzZg+vGOk
 rTLyCRulecpcO+MtQZPW2C9vDZZXdCNxQrAEnSVEc2Tx+OhD9zJaJbzoqsmAWJFhP9ke
 34YOdzfr6Jxc8oVzkJqTFFo7hdkVMeSfDqeGTK/+a4FYMULtOAzLsHyvjkhEHqR7unA0
 9PYPY3ffqp/16d9dLbWPCulQxMeBfWjVpQXeM+/8nNA5G++4SW6tjDDiMQ4JbnP8uCfz
 57bNHMLGUikZC1NHAz8GbER3MopQuVNvKJo84SUiZwDNrKIe8+YuaY/SHq3HbnJ+VCEM
 3h6A==
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
Cc: amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTYuMTAuMTkgdW0gMTI6MDkgc2NocmllYiBCYXMgTmlldXdlbmh1aXplbjoKPiBPbiBNb24s
IEp1bCAyOSwgMjAxOSBhdCAxMTozMiBBTSBDaHJpc3RpYW4gS8O2bmlnCj4gPGNrb2VuaWcubGVp
Y2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPj4+IElzIHRoaXMgYSBrbm93biBpc3N1ZT8K
Pj4gTm8sIHRoYXQgbG9va3MgbGlrZSBhIG5ldyBvbmUgdG8gbWUuCj4+Cj4+IElzIHRoYXQgc29t
ZWhvdyByZXByb2R1Y2libGU/Cj4gSSB0cmllZCBmaW5kaW5nIGEgcmVsaWFibGUgcmVwcm9kdWNl
ciAob25seSBWdWxrYW4gQ1RTIHJ1bnMgdW5jb21tb25seQo+IGNhdWdodCBpdCksIGJ1dCBjb3Vs
ZCBub3QgZmluZCBhbnl0aGluZyBiZXR0ZXIuCj4KPiBIb3dldmVyIHRoaXMgaXNzdWUgc2VlbXMg
dG8gYmUgZml4ZWQgd2l0aCBvbmUgb2YgdGhlIGZvbGxvd2luZyBwYXRjaGVzCj4gZnJvbSBkcm0t
bWlzYy1maXhlczoKPgo+ICJkcm0vdHRtOiBmaXggaGFuZGxpbmcgaW4gdHRtX2JvX2FkZF9tZW1f
dG9fbHJ1Igo+ICJkcm0vdHRtOiBmaXggYnVzeSByZWZlcmVuY2UgaW4gdHRtX21lbV9ldmljdF9m
aXJzdCIKPgo+IEkgaGF2ZW4ndCBzZWVuIHRoZSBpc3N1ZSBpbiAxMDAgQ1RTIHJ1bnMuCgpUaGFu
a3MgZm9yIHRoZSBpbmZvcm1hdGlvbi4KCkknbSBjdXJyZW50bHkgY29tcGxldGVseSByZXdvcmtp
bmcgdGhlIGhhbmRsaW5nIGFuZCB0cnlpbmcgdG8gZ2V0IHJpZCBvZiAKYWxsIHRoZSByZWZlcmVu
Y2UgZHJvcHBpbmcgd2hpY2gganVzdCByZXN1bHRzIGluIGEgQlVHKCkuCgpJc3N1ZXMgbGlrZSB0
aGF0IG9uZSB3aWxsIHRoZW4gaG9wZWZ1bGx5IGNvbXBsZXRlbHkgZGlzYXBwZWFyLgoKUmVnYXJk
cywKQ2hyaXN0aWFuLgoKPgo+IFRoYW5rcywKPiBCYXMKPgo+PiBDaHJpc3RpYW4uCj4+Cj4+IEFt
IDI5LjA3LjE5IHVtIDEwOjE0IHNjaHJpZWIgQmFzIE5pZXV3ZW5odWl6ZW46Cj4+PiBIaSBhbGws
Cj4+Pgo+Pj4gSSBoYXZlIGEgVFRNIHJlZmNvdW50IGlzc3VlOgo+Pj4KPj4+IFsxNzM3NzQuMzA5
OTY4XSAtLS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0KPj4+IFsxNzM3NzQuMzA5
OTcwXSBrZXJuZWwgQlVHIGF0IGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmM6MjAyIQo+Pj4g
WzE3Mzc3NC4zMDk5ODJdIGludmFsaWQgb3Bjb2RlOiAwMDAwIFsjMV0gUFJFRU1QVCBTTVAgTk9Q
VEkKPj4+IFsxNzM3NzQuMzA5OTg1XSBDUFU6IDEzIFBJRDogMTI4MjE0IENvbW06IGt3b3JrZXIv
MTM6MiBOb3QgdGFpbnRlZAo+Pj4gNS4yLjAtcmMxLWczZjJlNTE5YjA5NzQgIzEwCj4+PiBbMTcz
Nzc0LjMwOTk4Nl0gSGFyZHdhcmUgbmFtZTogVG8gQmUgRmlsbGVkIEJ5IE8uRS5NLiBUbyBCZSBG
aWxsZWQgQnkKPj4+IE8uRS5NLi9YMzk5IFRhaWNoaSwgQklPUyBQMS41MCAwOS8wNS8yMDE3Cj4+
PiBbMTczNzc0LjMwOTk5NV0gV29ya3F1ZXVlOiBldmVudHMgdHRtX2JvX2RlbGF5ZWRfd29ya3F1
ZXVlIFt0dG1dCj4+PiBbMTczNzc0LjMxMDAwMF0gUklQOiAwMDEwOnR0bV9ib19yZWZfYnVnKzB4
NS8weDEwIFt0dG1dCj4+PiBbMTczNzc0LjMxMDAwMl0gQ29kZTogYzAgYzMgYjggMDEgMDAgMDAg
MDAgYzMgNjYgNjYgMmUgMGYgMWYgODQgMDAgMDAKPj4+IDAwIDAwIDAwIDY2IDkwIDBmIDFmIDQ0
IDAwIDAwIGYwIGZmIDhmIGE0IDAwIDAwIDAwIGMzIDBmIDFmIDAwIDBmIDFmCj4+PiA0NCAwMCAw
MCA8MGY+IDBiIDY2IDBmIDFmIDg0IDAwIDAwIDAwIDAwIDAwIDBmIDFmIDQ0IDAwIDAwIDUzIDQ4
IDhiIDA3Cj4+PiA0OCA4OQo+Pj4gWzE3Mzc3NC4zMTAwMDNdIFJTUDogMDAxODpmZmZmYjQyZTU1
ODliZGU4IEVGTEFHUzogMDAwMTAyNDYKPj4+IFsxNzM3NzQuMzEwMDA1XSBSQVg6IGZmZmZiNDJl
NTU4OWJlNDAgUkJYOiBmZmZmOTM5NWZkMGNkOTA4IFJDWDoKPj4+IGZmZmY5Mzk1ZmQwY2Q4ZjgK
Pj4+IFsxNzM3NzQuMzEwMDA2XSBSRFg6IGZmZmZiNDJlNTU4OWJlNDAgUlNJOiBmZmZmOTM5YjU5
YjY0ZjE4IFJESToKPj4+IGZmZmY5Mzk1ZmQwY2Q4N2MKPj4+IFsxNzM3NzQuMzEwMDA3XSBSQlA6
IGZmZmZmZmZmYzA5MzBmNDAgUjA4OiAwMDAwMDAwMDAwMTQwMDAwIFIwOToKPj4+IGZmZmZmZmZm
YzA5MWYxMDAKPj4+IFsxNzM3NzQuMzEwMDA4XSBSMTA6IGZmZmY5Mzk5ZjY5YjA4MDAgUjExOiAw
MDAwMDAwMDAwMDAwMDAxIFIxMjoKPj4+IDAwMDAwMDAwMDAwMDAwMDAKPj4+IFsxNzM3NzQuMzEw
MDA5XSBSMTM6IGZmZmY5Mzk1ZmQwY2Q4NTAgUjE0OiAwMDAwMDAwMDAwMDAwMDAxIFIxNToKPj4+
IDAwMDAwMDAwMDAwMDAwMDEKPj4+IFsxNzM3NzQuMzEwMDEwXSBGUzogIDAwMDAwMDAwMDAwMDAw
MDAoMDAwMCkgR1M6ZmZmZjkzOWI3ZDM0MDAwMCgwMDAwKQo+Pj4ga25sR1M6MDAwMDAwMDAwMDAw
MDAwMAo+Pj4gWzE3Mzc3NC4zMTAwMTFdIENTOiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6
IDAwMDAwMDAwODAwNTAwMzMKPj4+IFsxNzM3NzQuMzEwMDEyXSBDUjI6IDAwMDA3ZjRmNjQwMDg4
MzggQ1IzOiAwMDAwMDAwNjQzYmFhMDAwIENSNDoKPj4+IDAwMDAwMDAwMDAzNDA2ZTAKPj4+IFsx
NzM3NzQuMzEwMDEzXSBDYWxsIFRyYWNlOgo+Pj4gWzE3Mzc3NC4zMTAwMTldICB0dG1fYm9fY2xl
YW51cF9yZWZzKzB4MTYwLzB4MWUwIFt0dG1dCj4+PiBbMTczNzc0LjMxMDAyNV0gIHR0bV9ib19k
ZWxheWVkX2RlbGV0ZSsweGE4LzB4MWUwIFt0dG1dCj4+PiBbMTczNzc0LjMxMDAyOV0gIHR0bV9i
b19kZWxheWVkX3dvcmtxdWV1ZSsweDE3LzB4NDAgW3R0bV0KPj4+IFsxNzM3NzQuMzEwMDMzXSAg
cHJvY2Vzc19vbmVfd29yaysweDFmZC8weDQzMAo+Pj4gWzE3Mzc3NC4zMTAwMzZdICB3b3JrZXJf
dGhyZWFkKzB4MmQvMHgzZDAKPj4+IFsxNzM3NzQuMzEwMDM4XSAgPyBwcm9jZXNzX29uZV93b3Jr
KzB4NDMwLzB4NDMwCj4+PiBbMTczNzc0LjMxMDA0MF0gIGt0aHJlYWQrMHgxMTIvMHgxMzAKPj4+
IFsxNzM3NzQuMzEwMDQyXSAgPyBrdGhyZWFkX2NyZWF0ZV9vbl9ub2RlKzB4NjAvMHg2MAo+Pj4g
WzE3Mzc3NC4zMTAwNDVdICByZXRfZnJvbV9mb3JrKzB4MjIvMHg0MAo+Pj4gWzE3Mzc3NC4zMTAw
NDhdIE1vZHVsZXMgbGlua2VkIGluOiBmdXNlIG5jdDY3NzUgaHdtb25fdmlkCj4+PiBubHNfaXNv
ODg1OV8xIG5sc19jcDQzNyB2ZmF0IGZhdCBlZGFjX21jZV9hbWQga3ZtX2FtZCBrdm0gaXJxYnlw
YXNzCj4+PiBhbWRncHUgYXJjNCBpd2xtdm0gbWFjODAyMTEgc25kX3VzYl9hdWRpbyB1dmN2aWRl
byBzbmRfdXNibWlkaV9saWIKPj4+IHZpZGVvYnVmMl92bWFsbG9jIGNyY3QxMGRpZl9wY2xtdWwg
dmlkZW9idWYyX21lbW9wcwo+Pj4gc25kX2hkYV9jb2RlY19yZWFsdGVrIHZpZGVvYnVmMl92NGwy
IGJ0dXNiIGdwdV9zY2hlZCBzbmRfcmF3bWlkaQo+Pj4gdmlkZW9idWYyX2NvbW1vbiBzbmRfaGRh
X2NvZGVjX2dlbmVyaWMgYnRydGwgdmlkZW9kZXYgY3JjMzJfcGNsbXVsCj4+PiBidGJjbSBzbmRf
c2VxX2RldmljZSBsZWR0cmlnX2F1ZGlvIHR0bSBidGludGVsIGdoYXNoX2NsbXVsbmlfaW50ZWwK
Pj4+IHdtaV9ibW9mIG14bV93bWkgc25kX2hkYV9jb2RlY19oZG1pIG1lZGlhIGJsdWV0b290aCBk
cm1fa21zX2hlbHBlcgo+Pj4gaXdsd2lmaSBzbmRfaGRhX2ludGVsIGRybSBhZXNuaV9pbnRlbCBz
bmRfaGRhX2NvZGVjIGpveWRldiBpbnB1dF9sZWRzCj4+PiBhZXNfeDg2XzY0IHNuZF9oZGFfY29y
ZSBtb3VzZWRldiBldmRldiBjcnlwdG9fc2ltZCBjcnlwdGQgZWNkaF9nZW5lcmljCj4+PiBsZWRf
Y2xhc3MgYWdwZ2FydCBzbmRfaHdkZXAgbWFjX2hpZCBjZGNfYWNtIGdsdWVfaGVscGVyIGVjYyBz
bmRfcGNtCj4+PiBpZ2Igc3lzY29weWFyZWEgcGNzcGtyIGNmZzgwMjExIHN5c2ZpbGxyZWN0IHNu
ZF90aW1lciBzeXNpbWdibHQgc25kCj4+PiBmYl9zeXNfZm9wcyBjY3AgcHRwIHNvdW5kY29yZSBw
cHNfY29yZSBybmdfY29yZSBrMTB0ZW1wIGkyY19hbGdvX2JpdAo+Pj4gc3A1MTAwX3RjbyBkY2Eg
aTJjX3BpaXg0IHJma2lsbCB3bWkgcGNjX2NwdWZyZXEgYnV0dG9uIGFjcGlfY3B1ZnJlcQo+Pj4g
c2NoX2ZxX2NvZGVsIGlwX3RhYmxlcyB4X3RhYmxlcyBleHQ0IGNyYzMyY19nZW5lcmljIGNyYzE2
IG1iY2FjaGUgamJkMgo+Pj4gc2RfbW9kCj4+PiBbMTczNzc0LjMxMDA4NV0gIGhpZF9nZW5lcmlj
IHVzYmhpZCBoaWQgY3JjMzJjX2ludGVsIGFoY2kgeGhjaV9wY2kKPj4+IGxpYmFoY2kgeGhjaV9o
Y2QgbGliYXRhIHVzYmNvcmUgc2NzaV9tb2QgdXNiX2NvbW1vbgo+Pj4gWzE3Mzc3NC4zMTAwOTRd
IC0tLVsgZW5kIHRyYWNlIDFmOGQyMTk4MGMwYjNmZDUgXS0tLQo+Pj4gWzE3Mzc3NC4zMTAwOTdd
IFJJUDogMDAxMDp0dG1fYm9fcmVmX2J1ZysweDUvMHgxMCBbdHRtXQo+Pj4gWzE3Mzc3NC4zMTAw
OTldIENvZGU6IGMwIGMzIGI4IDAxIDAwIDAwIDAwIGMzIDY2IDY2IDJlIDBmIDFmIDg0IDAwIDAw
Cj4+PiAwMCAwMCAwMCA2NiA5MCAwZiAxZiA0NCAwMCAwMCBmMCBmZiA4ZiBhNCAwMCAwMCAwMCBj
MyAwZiAxZiAwMCAwZiAxZgo+Pj4gNDQgMDAgMDAgPDBmPiAwYiA2NiAwZiAxZiA4NCAwMCAwMCAw
MCAwMCAwMCAwZiAxZiA0NCAwMCAwMCA1MyA0OCA4YiAwNwo+Pj4gNDggODkKPj4+IFsxNzM3NzQu
MzEwMTAwXSBSU1A6IDAwMTg6ZmZmZmI0MmU1NTg5YmRlOCBFRkxBR1M6IDAwMDEwMjQ2Cj4+PiBb
MTczNzc0LjMxMDEwMV0gUkFYOiBmZmZmYjQyZTU1ODliZTQwIFJCWDogZmZmZjkzOTVmZDBjZDkw
OCBSQ1g6Cj4+PiBmZmZmOTM5NWZkMGNkOGY4Cj4+PiBbMTczNzc0LjMxMDEwMl0gUkRYOiBmZmZm
YjQyZTU1ODliZTQwIFJTSTogZmZmZjkzOWI1OWI2NGYxOCBSREk6Cj4+PiBmZmZmOTM5NWZkMGNk
ODdjCj4+PiBbMTczNzc0LjMxMDEwM10gUkJQOiBmZmZmZmZmZmMwOTMwZjQwIFIwODogMDAwMDAw
MDAwMDE0MDAwMCBSMDk6Cj4+PiBmZmZmZmZmZmMwOTFmMTAwCj4+PiBbMTczNzc0LjMxMDEwNF0g
UjEwOiBmZmZmOTM5OWY2OWIwODAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMSBSMTI6Cj4+PiAwMDAw
MDAwMDAwMDAwMDAwCj4+PiBbMTczNzc0LjMxMDEwNF0gUjEzOiBmZmZmOTM5NWZkMGNkODUwIFIx
NDogMDAwMDAwMDAwMDAwMDAwMSBSMTU6Cj4+PiAwMDAwMDAwMDAwMDAwMDAxCj4+PiBbMTczNzc0
LjMxMDEwNl0gRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY5MzliN2QzNDAwMDAo
MDAwMCkKPj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKPj4+IFsxNzM3NzQuMzEwMTA3XSBDUzog
IDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCj4+PiBbMTczNzc0
LjMxMDEwN10gQ1IyOiAwMDAwN2Y0ZjY0MDA4ODM4IENSMzogMDAwMDAwMDY0M2JhYTAwMCBDUjQ6
Cj4+PiAwMDAwMDAwMDAwMzQwNmUwCj4+PiBbMTczNzc0LjMxMDExMF0gbm90ZToga3dvcmtlci8x
MzoyWzEyODIxNF0gZXhpdGVkIHdpdGggcHJlZW1wdF9jb3VudCAxCj4+Pgo+Pj4KPj4+IFdpdGgg
YW1kLXN0YWdpbmctZHJtLW5leHQ6Cj4+Pgo+Pj4gY29tbWl0IDIwZDZiOWMzYjdmNDBlYzQyN2Fm
OTEyZDE0MGYyYmUwZGUwOThkMmQgKG9yaWdpbi9hbWQtc3RhZ2luZy1kcm0tbmV4dCkKPj4+IEF1
dGhvcjogR3VzdGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPj4+IERh
dGU6ICAgTW9uIEp1bCAyMiAxMjo0NzoxNiAyMDE5IC0wNTAwCj4+Pgo+Pj4gICAgICAgZHJtL2Ft
ZGtmZC9rZmRfbXFkX21hbmFnZXJfdjEwOiBBdm9pZCBmYWxsLXRocm91Z2ggd2FybmluZwo+Pj4K
Pj4+IHdpdGggYSBWZWdhMTAuCj4+Pgo+Pj4gSXMgdGhpcyBhIGtub3duIGlzc3VlPwo+Pj4KPj4+
IFRoYW5rcywKPj4+IEJhcwo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9hbWQtZ2Z4Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
bWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZng=
