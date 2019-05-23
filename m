Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AD429A7E
	for <lists+amd-gfx@lfdr.de>; Fri, 24 May 2019 17:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F848923D;
	Fri, 24 May 2019 15:01:13 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD366E039;
 Thu, 23 May 2019 21:49:28 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NLhifU004317;
 Thu, 23 May 2019 21:49:13 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2130.oracle.com with ESMTP id 2smsk5n948-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 21:49:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NLmFZJ185512;
 Thu, 23 May 2019 21:49:12 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3020.oracle.com with ESMTP id 2smsgvrm93-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 21:49:12 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x4NLn8SI003595;
 Thu, 23 May 2019 21:49:09 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 May 2019 21:49:08 +0000
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
 <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
 <20190523201105.oifkksus4rzcwqt4@mbp>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <ffe58af3-7c70-d559-69f6-1f6ebcb0fec6@oracle.com>
Date: Thu, 23 May 2019 15:49:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523201105.oifkksus4rzcwqt4@mbp>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905230139
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9266
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905230139
X-Mailman-Approved-At: Fri, 24 May 2019 15:01:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=CA4BRvH7LpSOvdwGQ1RgbPK5R7ura7qGqy4SrVn6TGs=;
 b=X//cpGAKkvYu1m1BjaIbh5y4EYuwM+8rZjWW5aAmW0vi1toc+ON7ojqHQsbcK6pAW1oD
 bdaUeEmghYKNyuWdojEirpuCtcEnGnpjzGNjA/TAPNGPvcylGBa+20OGWCMnCwLHj8Tf
 YRS6xbAb5NCY6/3hnPEk+xsQaxia6MP4a6XjVZSvoh9chZIbCYwa7XRJ+TOdhejZB+v7
 XSe3hifUXqlRGwDwQJJUjbd8e+die4vTzQ+aF3wEY1CdthC5hOmZQere78SM0w/UZFJa
 y1F1RpJmvyYHjzu9jq9fzTHoce2ebfeYA5vSKPJb2pXe3nPIQrp8MMBgMFftquXsLaI1 XQ== 
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgenii Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Andrey Konovalov <andreyknvl@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@mellanox.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Elliott Hughes <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gNS8yMy8xOSAyOjExIFBNLCBDYXRhbGluIE1hcmluYXMgd3JvdGU6Cj4gSGkgS2hhbGlkLAo+
IAo+IE9uIFRodSwgTWF5IDIzLCAyMDE5IGF0IDExOjUxOjQwQU0gLTA2MDAsIEtoYWxpZCBBeml6
IHdyb3RlOgo+PiBPbiA1LzIxLzE5IDY6MDQgUE0sIEtlZXMgQ29vayB3cm90ZToKPj4+IEFzIGFu
IGFzaWRlOiBJIHRoaW5rIFNwYXJjIEFESSBzdXBwb3J0IGluIExpbnV4IGFjdHVhbGx5IHNpZGUt
c3RlcHBlZAo+Pj4gdGhpc1sxXSAoaS5lLiBjaG9zZSAic29sdXRpb24gMSIpOiAiQWxsIGFkZHJl
c3NlcyBwYXNzZWQgdG8ga2VybmVsIG11c3QKPj4+IGJlIG5vbi1BREkgdGFnZ2VkIGFkZHJlc3Nl
cy4iIChBbmQgc2FkbHksICJLZXJuZWwgZG9lcyBub3QgZW5hYmxlIEFESQo+Pj4gZm9yIGtlcm5l
bCBjb2RlLiIpIEkgdGhpbmsgdGhpcyB3YXMgYSBtaXN0YWtlIHdlIHNob3VsZCBub3QgcmVwZWF0
IGZvcgo+Pj4gYXJtNjQgKHdlIGRvIHNlZW0gdG8gYmUgYXQgbGVhc3QgaW4gYWdyZWVtZW50IGFi
b3V0IHRoaXMsIEkgdGhpbmspLgo+Pj4KPj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9w
YXRjaHdvcmsvcGF0Y2gvNjU0NDgxLwo+Pgo+PiBUaGF0IGlzIGEgdmVyeSBlYXJseSB2ZXJzaW9u
IG9mIHRoZSBzcGFyYyBBREkgcGF0Y2guIFN1cHBvcnQgZm9yIHRhZ2dlZAo+PiBhZGRyZXNzZXMg
aW4gc3lzY2FsbHMgd2FzIGFkZGVkIGluIGxhdGVyIHZlcnNpb25zIGFuZCBpcyBpbiB0aGUgcGF0
Y2gKPj4gdGhhdCBpcyBpbiB0aGUga2VybmVsLgo+IAo+IEkgdHJpZWQgdG8gZmlndXJlIG91dCBi
dXQgSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoZSBzcGFyYyBwb3J0LiBIb3cgZGlkCj4geW91IHNv
bHZlIHRoZSB0YWdnZWQgYWRkcmVzcyBnb2luZyBpbnRvIHZhcmlvdXMgc3lzY2FsbCBpbXBsZW1l
bnRhdGlvbnMKPiBpbiB0aGUga2VybmVsIChlLmcuIHN5c193cml0ZSk/IElzIHRoZSB0YWcgcmVt
b3ZlZCBvbiBrZXJuZWwgZW50cnkgb3IgaXQKPiBlbmRzIHVwIGRlZXBlciBpbiB0aGUgY29yZSBj
b2RlPwo+IAoKQW5vdGhlciBzcG90IEkgc2hvdWxkIHBvaW50IG91dCBpbiBBREkgcGF0Y2ggLSBU
YWdzIGFyZSBub3Qgc3RvcmVkIGluClZNQXMgYW5kIElPTU1VIGRvZXMgbm90IHN1cHBvcnQgQURJ
IHRhZ3Mgb24gTTcuIEFESSB0YWdzIGFyZSBzdHJpcHBlZApiZWZvcmUgdXNlcnNwYWNlIGFkZHJl
c3NlcyBhcmUgcGFzc2VkIHRvIElPTU1VIGluIHRoZSBmb2xsb3dpbmcgc25pcHBldApmcm9tIHRo
ZSBwYXRjaDoKCmRpZmYgLS1naXQgYS9hcmNoL3NwYXJjL21tL2d1cC5jIGIvYXJjaC9zcGFyYy9t
bS9ndXAuYwppbmRleCA1MzM1YmEzYzg1MGUuLjM1N2I2MDQ3NjUzYSAxMDA2NDQKLS0tIGEvYXJj
aC9zcGFyYy9tbS9ndXAuYworKysgYi9hcmNoL3NwYXJjL21tL2d1cC5jCkBAIC0yMDEsNiArMjAy
LDI0IEBAIGludCBfX2dldF91c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFydCwgaW50
Cm5yX3BhZ2VzCiwgaW50IHdyaXRlLAogICAgICAgIHBnZF90ICpwZ2RwOwogICAgICAgIGludCBu
ciA9IDA7CgorI2lmZGVmIENPTkZJR19TUEFSQzY0CisgICAgICAgaWYgKGFkaV9jYXBhYmxlKCkp
IHsKKyAgICAgICAgICAgICAgIGxvbmcgYWRkciA9IHN0YXJ0OworCisgICAgICAgICAgICAgICAv
KiBJZiB1c2Vyc3BhY2UgaGFzIHBhc3NlZCBhIHZlcnNpb25lZCBhZGRyZXNzLCBrZXJuZWwKKyAg
ICAgICAgICAgICAgICAqIHdpbGwgbm90IGZpbmQgaXQgaW4gdGhlIFZNQXMgc2luY2UgaXQgZG9l
cyBub3Qgc3RvcmUKKyAgICAgICAgICAgICAgICAqIHRoZSB2ZXJzaW9uIHRhZ3MgaW4gdGhlIGxp
c3Qgb2YgVk1Bcy4gU3RvcmluZyB2ZXJzaW9uCisgICAgICAgICAgICAgICAgKiB0YWdzIGluIGxp
c3Qgb2YgVk1BcyBpcyBpbXByYWN0aWNhbCBzaW5jZSB0aGV5IGNhbiBiZQorICAgICAgICAgICAg
ICAgICogY2hhbmdlZCBhbnkgdGltZSBmcm9tIHVzZXJzcGFjZSB3aXRob3V0IGRyb3BwaW5nIGlu
dG8KKyAgICAgICAgICAgICAgICAqIGtlcm5lbC4gQW55IGFkZHJlc3Mgc2VhcmNoIGluIFZNQXMg
d2lsbCBiZSBkb25lIHdpdGgKKyAgICAgICAgICAgICAgICAqIG5vbi12ZXJzaW9uZWQgYWRkcmVz
c2VzLiBFbnN1cmUgdGhlIEFESSB2ZXJzaW9uIGJpdHMKKyAgICAgICAgICAgICAgICAqIGFyZSBk
cm9wcGVkIGhlcmUgYnkgc2lnbiBleHRlbmRpbmcgdGhlIGxhc3QgYml0IGJlZm9yZQorICAgICAg
ICAgICAgICAgICogQURJIGJpdHMuIElPTU1VIGRvZXMgbm90IGltcGxlbWVudCB2ZXJzaW9uIHRh
Z3MuCisgICAgICAgICAgICAgICAgKi8KKyAgICAgICAgICAgICAgIGFkZHIgPSAoYWRkciA8PCAo
bG9uZylhZGlfbmJpdHMoKSkgPj4gKGxvbmcpYWRpX25iaXRzKCk7CisgICAgICAgICAgICAgICBz
dGFydCA9IGFkZHI7CisgICAgICAgfQorI2VuZGlmCiAgICAgICAgc3RhcnQgJj0gUEFHRV9NQVNL
OwogICAgICAgIGFkZHIgPSBzdGFydDsKICAgICAgICBsZW4gPSAodW5zaWduZWQgbG9uZykgbnJf
cGFnZXMgPDwgUEFHRV9TSElGVDsKCgotLQpLaGFsaWQKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2FtZC1nZng=
