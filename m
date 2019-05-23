Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF3D2856A
	for <lists+amd-gfx@lfdr.de>; Thu, 23 May 2019 19:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26A0689D87;
	Thu, 23 May 2019 17:56:46 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9A989FF6;
 Thu, 23 May 2019 17:52:08 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NHcV4s194594;
 Thu, 23 May 2019 17:51:53 GMT
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 2smsk5c473-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 17:51:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x4NHpCpe145061;
 Thu, 23 May 2019 17:51:52 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2smshfd4y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 May 2019 17:51:52 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x4NHphUB003086;
 Thu, 23 May 2019 17:51:44 GMT
Received: from [192.168.1.16] (/24.9.64.241)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 23 May 2019 17:51:43 +0000
Subject: Re: [PATCH v15 00/17] arm64: untag user pointers passed to the kernel
To: Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>
References: <cover.1557160186.git.andreyknvl@google.com>
 <20190517144931.GA56186@arrakis.emea.arm.com>
 <CAFKCwrj6JEtp4BzhqO178LFJepmepoMx=G+YdC8sqZ3bcBp3EQ@mail.gmail.com>
 <20190521182932.sm4vxweuwo5ermyd@mbp> <201905211633.6C0BF0C2@keescook>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <6049844a-65f5-f513-5b58-7141588fef2b@oracle.com>
Date: Thu, 23 May 2019 11:51:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <201905211633.6C0BF0C2@keescook>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9265
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1905230119
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9265
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1905230119
X-Mailman-Approved-At: Thu, 23 May 2019 17:56:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=2Qeh79aDTooqgUiqrhLo6Vy7tycJTudTXGs6zz5dfRs=;
 b=vDS9uTH4+Zc8nPFLnuUvRu142pBiqAxGE5BbMuCn+MA1cOmcParAIWPYB10Gy4C7hxOT
 CRf7KLq6LlEZK+PTvChfiuPo3LEMa9ckzl+/kAdOakkMJYpGPlnCYhLx+3+n6Ntz8J6i
 3fNosLO+WWxHrhBnbE6IQD52DA+Q7+ZHzBvkxtJ6IhCd+FH3wqHlFGg3maBxYupT10pT
 epJuSNSnm8akAZ06VD98fPXl3vSfL7K8WT0tE28XcUzOExtBXHl5878ViO1cXVVBk4Tq
 4+ZzcfJ8p6oqlalneN0hlMs1txpq4s5U0HxUj4eJGEhRr1s4PIHpmSUBA5IcjIQCgxcH gg== 
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
 Kevin Brodsky <kevin.brodsky@arm.com>,
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

T24gNS8yMS8xOSA2OjA0IFBNLCBLZWVzIENvb2sgd3JvdGU6Cj4gQXMgYW4gYXNpZGU6IEkgdGhp
bmsgU3BhcmMgQURJIHN1cHBvcnQgaW4gTGludXggYWN0dWFsbHkgc2lkZS1zdGVwcGVkCj4gdGhp
c1sxXSAoaS5lLiBjaG9zZSAic29sdXRpb24gMSIpOiAiQWxsIGFkZHJlc3NlcyBwYXNzZWQgdG8g
a2VybmVsIG11c3QKPiBiZSBub24tQURJIHRhZ2dlZCBhZGRyZXNzZXMuIiAoQW5kIHNhZGx5LCAi
S2VybmVsIGRvZXMgbm90IGVuYWJsZSBBREkKPiBmb3Iga2VybmVsIGNvZGUuIikgSSB0aGluayB0
aGlzIHdhcyBhIG1pc3Rha2Ugd2Ugc2hvdWxkIG5vdCByZXBlYXQgZm9yCj4gYXJtNjQgKHdlIGRv
IHNlZW0gdG8gYmUgYXQgbGVhc3QgaW4gYWdyZWVtZW50IGFib3V0IHRoaXMsIEkgdGhpbmspLgo+
IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvNjU0NDgxLwoK
ClRoYXQgaXMgYSB2ZXJ5IGVhcmx5IHZlcnNpb24gb2YgdGhlIHNwYXJjIEFESSBwYXRjaC4gU3Vw
cG9ydCBmb3IgdGFnZ2VkCmFkZHJlc3NlcyBpbiBzeXNjYWxscyB3YXMgYWRkZWQgaW4gbGF0ZXIg
dmVyc2lvbnMgYW5kIGlzIGluIHRoZSBwYXRjaAp0aGF0IGlzIGluIHRoZSBrZXJuZWwuCgpUaGF0
IHBhcnQgIktlcm5lbCBkb2VzIG5vdCBlbmFibGUgQURJIGZvciBrZXJuZWwgY29kZS4iIGlzIGNv
cnJlY3QuIEl0CmlzIGEgcG9zc2libGUgZW5oYW5jZW1lbnQgZm9yIGZ1dHVyZS4KCi0tCktoYWxp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdm
eCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
