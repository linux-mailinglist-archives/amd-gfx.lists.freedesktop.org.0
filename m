Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF12E234
	for <lists+amd-gfx@lfdr.de>; Wed, 29 May 2019 18:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC2456E0B7;
	Wed, 29 May 2019 16:24:51 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD146E33A;
 Wed, 29 May 2019 14:49:43 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TEmj59055774;
 Wed, 29 May 2019 14:49:23 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 2spu7djgus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 14:49:23 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4TEnL0O140618;
 Wed, 29 May 2019 14:49:22 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2ss1fngsh2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 May 2019 14:49:22 +0000
Received: from abhmp0007.oracle.com (abhmp0007.oracle.com [141.146.116.13])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4TEnF2L021623;
 Wed, 29 May 2019 14:49:16 GMT
Received: from concerto-wl.internal (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 May 2019 07:49:15 -0700
Message-ID: <3ade20696cc772772f5362fea02ede81c4a0fad3.camel@oracle.com>
Subject: Re: [PATCH v15 01/17] uaccess: add untagged_addr definition for
 other arches
From: Khalid Aziz <khalid.aziz@oracle.com>
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Date: Wed, 29 May 2019 08:49:09 -0600
In-Reply-To: <67ae3bd92e590d42af22ef2de0ad37b730a13837.1557160186.git.andreyknvl@google.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <67ae3bd92e590d42af22ef2de0ad37b730a13837.1557160186.git.andreyknvl@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9272
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905290098
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9272
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905290098
X-Mailman-Approved-At: Wed, 29 May 2019 16:24:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=message-id : subject
 : from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=corp-2018-07-02;
 bh=bdiE7HWyHmzeDdhgcpTkxNwVwsKMW5J4u0bwenhkW2I=;
 b=vAYGK9KOQKh1ci+61dIXEhKr/6PuEl3w9nerHoG2o6KZcTmroHCycrPlXsSVYoCc1D9e
 u53Af15v96j6SPmPoJ+syGA6mCGI1yCiY2PcW+gMzZiVseWDKwRqdfQ/vA5LKK20Ou6S
 qqH1kgPXhEpgNiGNUtFLQ9cNrcGvNjpxe3Gfdd5qauvpSfl3hiaspyOm5mJhBkWRqvwm
 IYx2v4CAD32zNH3jZdsRIlmsjtuapA8CQI+GAGIf1qsl+aD1+DqMFhyfxIFAGNXJW+cz
 9a5PK1sw72WXYdjOuDHWee7Q0Jai2TlWbMJfUWHm89DxiTdsjrZTZi400nmT0P2EZndw JQ== 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>, Lee Smith <Lee.Smith@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDE5LTA1LTA2IGF0IDE4OjMwICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3Rl
Ogo+IFRvIGFsbG93IGFybTY0IHN5c2NhbGxzIHRvIGFjY2VwdCB0YWdnZWQgcG9pbnRlcnMgZnJv
bSB1c2Vyc3BhY2UsIHdlCj4gbXVzdAo+IHVudGFnIHRoZW0gd2hlbiB0aGV5IGFyZSBwYXNzZWQg
dG8gdGhlIGtlcm5lbC4gU2luY2UgdW50YWdnaW5nIGlzCj4gZG9uZSBpbgo+IGdlbmVyaWMgcGFy
dHMgb2YgdGhlIGtlcm5lbCwgdGhlIHVudGFnZ2VkX2FkZHIgbWFjcm8gbmVlZHMgdG8gYmUKPiBk
ZWZpbmVkCj4gZm9yIGFsbCBhcmNoaXRlY3R1cmVzLgo+IAo+IERlZmluZSBpdCBhcyBhIG5vb3Ag
Zm9yIGFyY2hpdGVjdHVyZXMgb3RoZXIgdGhhbiBhcm02NC4KPiAKPiBBY2tlZC1ieTogQ2F0YWxp
biBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvbGlu
dXgvbW0uaCB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpBcyBk
aXNjdXNzZWQgaW4gdGhlIG90aGVyIHRocmVhZCBDaHJpcyBzdGFydGVkLCB0aGVyZSBpcyBhIGdl
bmVyaWMgbmVlZAp0byB1bnRhZyBhZGRyZXNzZXMgaW4ga2VybmVsIGFuZCB0aGlzIHBhdGNoIGdl
dHMgdXMgcmVhZHkgZm9yIHRoYXQuCgpSZXZpZXdlZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5h
eml6QG9yYWNsZS5jb20+Cgo+IAo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9p
bmNsdWRlL2xpbnV4L21tLmgKPiBpbmRleCA2YjEwYzIxNjMwZjUuLjQ0MDQxZGY4MDRhNiAxMDA2
NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L21tLmgK
PiBAQCAtOTksNiArOTksMTAgQEAgZXh0ZXJuIGludCBtbWFwX3JuZF9jb21wYXRfYml0cyBfX3Jl
YWRfbW9zdGx5Owo+ICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPiAgI2luY2x1ZGUgPGFzbS9w
cm9jZXNzb3IuaD4KPiAgCj4gKyNpZm5kZWYgdW50YWdnZWRfYWRkcgo+ICsjZGVmaW5lIHVudGFn
Z2VkX2FkZHIoYWRkcikgKGFkZHIpCj4gKyNlbmRpZgo+ICsKPiAgI2lmbmRlZiBfX3BhX3N5bWJv
bAo+ICAjZGVmaW5lIF9fcGFfc3ltYm9sKHgpICBfX3BhKFJFTE9DX0hJREUoKHVuc2lnbmVkIGxv
bmcpKHgpLCAwKSkKPiAgI2VuZGlmCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZng=
