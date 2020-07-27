Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C320822F909
	for <lists+amd-gfx@lfdr.de>; Mon, 27 Jul 2020 21:28:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2C7789D5C;
	Mon, 27 Jul 2020 19:28:27 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2074.outbound.protection.outlook.com [40.107.93.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAA889D5C;
 Mon, 27 Jul 2020 19:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZPtqpjTefNqGuy0HKltYt7u/UkNz9EZJXECxUIlZ4dhPh/WZLT/RrK9dYelzjmM3y+khI0FQB0bQZLkxz0FkkZ3B2lj2jBAbEx9/RM8yPjfZKhKC83KBYAU9whwcs8NIS5XFM6Sco5Y44XK+kieNl5QqGYZ3XBWzZtSeUzjCCx0EiUIMF2liwodYAvYzp/T8p4naqQKTO4tOGqwzlOcCSajzjO2GLI0sfbSpSTcaqVO4Sz3o8LTARcOMMoSej4pXeQGmK20IkCww9l3rJtikLlUn0JMIZxXC0UgKwja1DCVY1ZpfS9uFR/3zk0fJdd/GuF51wzHvtuqtC6v0lgjJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9hXZGd02O/XDpcv3LeQg/RGvBY67f6xKxq/r4rWuQY=;
 b=micOcWs0sh+8HaYLXB3HfHFpcJ/BkqQp0yMpUq2uypD7qNj1WD2UAFJVgUREiDfSx513zZivuA+SNKgPx9DVWu+mzXYQkjXKfXjG2720Mi8JjWWvhXKScHTy0bm7WK+DPfTOVx8yB5Oj8//zxpFcO8aI8MpoNh6tsulKyM0J8YQ8JADwsCjURdmBP5z+vKzBre+b4sdOs+3RQv0oQU9UykqwRzHtQWL2oWzRMh/tvxe0jJgPEnMaVDSWm3r5L4CO/IrTJ0NkU3cjvYZcfsQGBeLGu6VAS+cnCh7jRxA+HoYJDbEr9qr2Favps5LX88CLE+gZl/NqmeaxFJrmlVjDxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9hXZGd02O/XDpcv3LeQg/RGvBY67f6xKxq/r4rWuQY=;
 b=V4Rtd+YIEUjyCznUi+gu2HZLSkjKU6cUeTcsvRg2RVWMPRzjZdzfPbSP58fheCta6HT6y29ANhuEwEVSrJoCqXWjwc54S7OWr/QmrKNHMWKVDRMT1kQyjewF4ZB9zNpkfovtv+K2S0afARefgNtmkdTCkVEB6H11ZKwHi+o0Tqs=
Authentication-Results: molgen.mpg.de; dkim=none (message not signed)
 header.d=none;molgen.mpg.de; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Mon, 27 Jul
 2020 19:28:23 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3216.033; Mon, 27 Jul 2020
 19:28:23 +0000
Subject: Re: [PATCH] drm/amd/display: Clear dm_state for fast updates
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>,
 Mazin Rezk <mnrzk@protonmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <M0lxN5AUlPvzBKULfIBe5BZRwfQGXeMQCdWItYcQ-9P79y32WzExYK2Y0DwyNVtyGelqbvV07_lFk1oeT4cApbT-P_oH0bnxQbMmFsJv_xg=@protonmail.com>
 <ba078fb0-0dbc-df06-cfe9-f9537883f82a@amd.com>
 <e2f55480-c24f-6c85-08d3-21131a22d0bf@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <3b7e3e50-2ff7-eff3-2ffc-abaa4b36ce7f@amd.com>
Date: Mon, 27 Jul 2020 21:28:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e2f55480-c24f-6c85-08d3-21131a22d0bf@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0174.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::43) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0174.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::43) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23 via Frontend
 Transport; Mon, 27 Jul 2020 19:28:19 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a1a26105-45d0-4416-d3a8-08d8326339d5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3886BF181D3F10D40035600F83720@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zljo50kLvea1x8SB0UFXwXmJaeaStZji4KiqI6Ib4drwj3go6hqW+mdBkbABBVFjnsPZS+Z0YMT6gginG0h2efkQQC9kjdscyHjADPmIQhsar/wRNfRSLOVr1+Qp5YXnz0EKTkoCXRbZ2BE7dOR4xMrE3VIR1OEx90mg+f2nSy5QFk4A033IRitZS4LIVQoe3zc6VfNalV6irkJ6muAskPER9fJsLb8XzXYgrcdb9a4H1oGeyy40NLxGWP8Lz5CiT1JwRRXxchg0wMtGKLlH+chiuezow+KkSLYxL5Bz3nOeZtU991xp+DmLFC6gwD1+ZXHbNdc7iMrYZrsLD+aVCsw1JmgM7VWYTIzEiK022kHe25NK/ERyTki4sVMbfAWUe13ReB7SEClOofykDboqxNxL6ngWOxvUBdacDf9m74H3DnDEtOJVYTQwVxhsrBFzmpq/XNTXEfjaF6L9fFLfGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(7416002)(4326008)(316002)(478600001)(966005)(31686004)(2906002)(8936002)(66574015)(110136005)(54906003)(8676002)(66556008)(83380400001)(66476007)(6486002)(66946007)(15650500001)(2616005)(6666004)(5660300002)(16526019)(186003)(53546011)(52116002)(36756003)(86362001)(31696002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: rPU5mPmtTM4XnVPzAIoRv5k34aYkIpTEectF9EEI+IpywouyWEh5DnhQrETNP9ena7/svIhxtLimvaWcHqOryzj43Mf7Vd1LIef/uxgkFHJrWOL6AyoAIA7xSq34tozP5IVMpa9bkWKjW3yAtn/Zkvlti9Es6+6V6n6OZBumbWlw4KqZDF3i3nM+3TGogAkH5C3spn9oT7hx8RxlM+rWbV7jSVBTaBed0A0GSZwyUehLUrXPWhRCIrYVFi8150Ya33//CDw69d8zS5dpOGmKxeBX9lK+T273Uah1pVGioW5qsNAJ5fzRaMxHCyeK60xDzoUESuzUNL/A2Cica7HBHlZlBnfjWHLrGyaWkxayPDQIg7ql8AqyvBuFmMZZ3nVZ7rX1SNLgeY4LxnbGraxM7X3KefjmwXyOcc8eHG3+m8mtBpbznk/HYd804NLp8C9qR/Q7KqfMabtEqvLrLT5HL/S5LGuIJQx/5Ik17mqijkOR4XRBp5b94rzAKTfT7KYWEPITrvdsct0FoeVKxvED7i/h9Iw8NF/wA9G0TQ+/5RT39h3xmzHNexdqKvvmRvu5
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1a26105-45d0-4416-d3a8-08d8326339d5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2020 19:28:22.8839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0IS3YDSEJPNcReBOtsbKDf3oLjIi372mzbPlp+9N69qU6bgtczVih7hGVCcuaEg7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
X-BeenThere: amd-gfx@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion list for AMD gfx <amd-gfx.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx@lists.freedesktop.org>
List-Help: <mailto:amd-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request@lists.freedesktop.org?subject=subscribe>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "anthony.ruhier@gmail.com" <anthony.ruhier@gmail.com>,
 Duncan <1i5t5.duncan@cox.net>, Kees Cook <keescook@chromium.org>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "mphantomx@yahoo.com.br" <mphantomx@yahoo.com.br>,
 Harry Wentland <Harry.Wentland@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjcuMDcuMjAgdW0gMTY6MDUgc2NocmllYiBLYXpsYXVza2FzLCBOaWNob2xhczoKPiBPbiAy
MDIwLTA3LTI3IDk6MzkgYS5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjcuMDcu
MjAgdW0gMDc6NDAgc2NocmllYiBNYXppbiBSZXprOgo+Pj4gVGhpcyBwYXRjaCBmaXhlcyBhIHJh
Y2UgY29uZGl0aW9uIHRoYXQgY2F1c2VzIGEgdXNlLWFmdGVyLWZyZWUgZHVyaW5nCj4+PiBhbWRn
cHVfZG1fYXRvbWljX2NvbW1pdF90YWlsLiBUaGlzIGNhbiBvY2N1ciB3aGVuIDIgbm9uLWJsb2Nr
aW5nIAo+Pj4gY29tbWl0cwo+Pj4gYXJlIHJlcXVlc3RlZCBhbmQgdGhlIHNlY29uZCBvbmUgZmlu
aXNoZXMgYmVmb3JlIHRoZSBmaXJzdC4gCj4+PiBFc3NlbnRpYWxseSwKPj4+IHRoaXMgYnVnIG9j
Y3VycyB3aGVuIHRoZSBmb2xsb3dpbmcgc2VxdWVuY2Ugb2YgZXZlbnRzIGhhcHBlbnM6Cj4+Pgo+
Pj4gMS4gTm9uLWJsb2NraW5nIGNvbW1pdCAjMSBpcyByZXF1ZXN0ZWQgdy8gYSBuZXcgZG1fc3Rh
dGUgIzEgYW5kIGlzCj4+PiBkZWZlcnJlZCB0byB0aGUgd29ya3F1ZXVlLgo+Pj4KPj4+IDIuIE5v
bi1ibG9ja2luZyBjb21taXQgIzIgaXMgcmVxdWVzdGVkIHcvIGEgbmV3IGRtX3N0YXRlICMyIGFu
ZCBpcwo+Pj4gZGVmZXJyZWQgdG8gdGhlIHdvcmtxdWV1ZS4KPj4+Cj4+PiAzLiBDb21taXQgIzIg
c3RhcnRzIGJlZm9yZSBjb21taXQgIzEsIGRtX3N0YXRlICMxIGlzIHVzZWQgaW4gdGhlCj4+PiBj
b21taXRfdGFpbCBhbmQgY29tbWl0ICMyIGNvbXBsZXRlcywgZnJlZWluZyBkbV9zdGF0ZSAjMS4K
Pj4+Cj4+PiA0LiBDb21taXQgIzEgc3RhcnRzIGFmdGVyIGNvbW1pdCAjMiBjb21wbGV0ZXMsIHVz
ZXMgdGhlIGZyZWVkIGRtX3N0YXRlCj4+PiAxIGFuZCBkZXJlZmVyZW5jZXMgYSBmcmVlbGlzdCBw
b2ludGVyIHdoaWxlIHNldHRpbmcgdGhlIGNvbnRleHQuCj4+Cj4+IFdlbGwgSSBvbmx5IGhhdmUg
YSBvbmUgbWlsZSBoaWdoIHZpZXcgb24gdGhpcywgYnV0IHdoeSBkb24ndCB5b3UgbGV0IAo+PiB0
aGUgd29yayBpdGVtcyBleGVjdXRlIGluIG9yZGVyPwo+Pgo+PiBUaGF0IHdvdWxkIGJlIGJldHRl
ciBhbnl3YXkgY2F1c2UgdGhpcyB3YXkgd2UgZG9uJ3QgdHJpZ2dlciBhIGNhY2hlIAo+PiBsaW5l
IHBpbmcgcG9uZyBiZXR3ZWVuIENQVXMuCj4+Cj4+IENocmlzdGlhbi4KPgo+IFdlIHVzZSB0aGUg
RFJNIGhlbHBlcnMgZm9yIG1hbmFnaW5nIGRybV9hdG9taWNfY29tbWl0X3N0YXRlIGFuZCB0aG9z
ZSAKPiBoZWxwZXJzIGludGVybmFsbHkgcHVzaCBub24tYmxvY2tpbmcgY29tbWl0IHdvcmsgaW50
byB0aGUgc3lzdGVtIAo+IHVuYm91bmQgd29yayBxdWV1ZS4KCk1obSwgd2VsbCBpZiB5b3Ugc2Vu
ZCB0aG9zZSBoZWxwZXIgYXRvbWljIGNvbW1pdHMgaW4gdGhlIG9yZGVyIEEsQiBhbmQgCnRoZXkg
ZXhlY3V0ZSBpdCBpbiB0aGUgb3JkZXIgQixBIEkgd291bGQgY2FsbCB0aGF0IGEgYnVnIDopCgo+
IFdoaWxlIHdlIGNvdWxkIGR1cGxpY2F0ZSBhIGNvcHkgb2YgdGhhdCBjb2RlIHdpdGggbm90aGlu
ZyBidXQgdGhlIAo+IHdvcmtxdWV1ZSBjaGFuZ2VkIHRoYXQgaXNuJ3Qgc29tZXRoaW5nIEknZCBy
ZWFsbHkgbGlrZSB0byBtYWludGFpbiAKPiBnb2luZyBmb3J3YXJkLgoKSSdtIG5vdCB0YWxraW5n
IGFib3V0IGR1cGxpY2F0aW5nIHRoZSBjb2RlLCBJJ20gdGFsa2luZyBhYm91dCBmaXhpbmcgdGhl
IApoZWxwZXJzLiBJIGRvbid0IGtub3cgdGhhdCBjb2RlIHdlbGwsIGJ1dCBmcm9tIHRoZSBvdXRz
aWRlIGl0IHNvdW5kcyAKbGlrZSBhIGJ1ZyB0aGVyZS4KCkFuZCBleGVjdXRpbmcgd29yayBpdGVt
cyBpbiB0aGUgb3JkZXIgdGhleSBhcmUgc3VibWl0dGVkIGlzIHRyaXZpYWwuCgpIYWQgYW55Ym9k
eSBwaW5nZWQgRGFuaWVsIG9yIG90aGVyIHBlb3BsZSBmYW1pbGlhciB3aXRoIHRoZSBoZWxwZXIg
Y29kZSAKYWJvdXQgaXQ/CgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBOaWNo
b2xhcyBLYXpsYXVza2FzCj4KPj4KPj4+Cj4+PiBTaW5jZSB0aGlzIGJ1ZyBoYXMgb25seSBiZWVu
IHNwb3R0ZWQgd2l0aCBmYXN0IGNvbW1pdHMsIHRoaXMgcGF0Y2ggCj4+PiBmaXhlcwo+Pj4gdGhl
IGJ1ZyBieSBjbGVhcmluZyB0aGUgZG1fc3RhdGUgaW5zdGVhZCBvZiB1c2luZyB0aGUgb2xkIGRj
X3N0YXRlIGZvcgo+Pj4gZmFzdCB1cGRhdGVzLiBJbiBhZGRpdGlvbiwgc2luY2UgZG1fc3RhdGUg
aXMgb25seSB1c2VkIGZvciBpdHMgZGNfc3RhdGUKPj4+IGFuZCBhbWRncHVfZG1fYXRvbWljX2Nv
bW1pdF90YWlsIHdpbGwgcmV0YWluIHRoZSBkY19zdGF0ZSBpZiBub25lIGlzIAo+Pj4gZm91bmQs
Cj4+PiByZW1vdmluZyB0aGUgZG1fc3RhdGUgc2hvdWxkIG5vdCBoYXZlIGFueSBjb25zZXF1ZW5j
ZXMgaW4gZmFzdCB1cGRhdGVzLgo+Pj4KPj4+IFRoaXMgdXNlLWFmdGVyLWZyZWUgYnVnIGhhcyBl
eGlzdGVkIGZvciBhIHdoaWxlIG5vdywgYnV0IG9ubHkgY2F1c2VkIGEKPj4+IG5vdGljZWFibGUg
aXNzdWUgc3RhcnRpbmcgZnJvbSA1LjctcmMxIGR1ZSB0byAzMjAyZmE2MmYgKCJzbHViOiAKPj4+
IHJlbG9jYXRlCj4+PiBmcmVlbGlzdCBwb2ludGVyIHRvIG1pZGRsZSBvZiBvYmplY3QiKSBtb3Zp
bmcgdGhlIGZyZWVsaXN0IHBvaW50ZXIgZnJvbQo+Pj4gZG1fc3RhdGUtPmJhc2UgKHdoaWNoIHdh
cyB1bnVzZWQpIHRvIGRtX3N0YXRlLT5jb250ZXh0ICh3aGljaCBpcwo+Pj4gZGVyZWZlcmVuY2Vk
KS4KPj4+Cj4+PiBCdWd6aWxsYTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVn
LmNnaT9pZD0yMDczODMKPj4+IEZpeGVzOiBiZDIwMGQxOTBmNDUgKCJkcm0vYW1kL2Rpc3BsYXk6
IERvbid0IHJlcGxhY2UgdGhlIGRjX3N0YXRlIAo+Pj4gZm9yIGZhc3QgdXBkYXRlcyIpCj4+PiBS
ZXBvcnRlZC1ieTogRHVuY2FuIDwxaTV0NS5kdW5jYW5AY294Lm5ldD4KPj4+IFNpZ25lZC1vZmYt
Ynk6IE1hemluIFJlemsgPG1ucnprQHByb3Rvbm1haWwuY29tPgo+Pj4gLS0tCj4+PiDCoCAuLi4v
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAzNiAKPj4+ICsrKysr
KysrKysrKysrLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4+PiBpbmRleCA4NmZmYTBjMjg4MGYuLjcxMGVk
YzcwZTM3ZSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRn
cHVfZG0vYW1kZ3B1X2RtLmMKPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9h
bWRncHVfZG0vYW1kZ3B1X2RtLmMKPj4+IEBAIC04NzE3LDIwICs4NzE3LDM4IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2RtX2F0b21pY19jaGVjayhzdHJ1Y3QgCj4+PiBkcm1fZGV2aWNlICpkZXYsCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBzYW1lIHJlc291cmNlLiBJZiB3ZSBoYXZlIGEg
bmV3IERDIGNvbnRleHQgYXMgcGFydCBvZgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0aGUg
RE0gYXRvbWljIHN0YXRlIGZyb20gdmFsaWRhdGlvbiB3ZSBuZWVkIHRvIGZyZWUgaXQgYW5kCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHJldGFpbiB0aGUgZXhpc3Rpbmcgb25lIGluc3RlYWQu
Cj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIEZ1cnRoZXJt
b3JlLCBzaW5jZSB0aGUgRE0gYXRvbWljIHN0YXRlIG9ubHkgY29udGFpbnMgdGhlIERDCj4+PiAr
wqDCoMKgwqDCoMKgwqDCoCAqIGNvbnRleHQgYW5kIGNhbiBzYWZlbHkgYmUgYW5udWxsZWQsIHdl
IGNhbiBmcmVlIHRoZSBzdGF0ZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBhbmQgY2xlYXIgdGhl
IGFzc29jaWF0ZWQgcHJpdmF0ZSBvYmplY3Qgbm93IHRvIGZyZWUKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogc29tZSBtZW1vcnkgYW5kIGF2b2lkIGEgcG9zc2libGUgdXNlLWFmdGVyLWZyZWUgbGF0
ZXIuCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+Pj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVj
dCBkbV9hdG9taWNfc3RhdGUgKm5ld19kbV9zdGF0ZSwgKm9sZF9kbV9zdGF0ZTsKPj4+Cj4+PiAt
wqDCoMKgwqDCoMKgwqAgbmV3X2RtX3N0YXRlID0gZG1fYXRvbWljX2dldF9uZXdfc3RhdGUoc3Rh
dGUpOwo+Pj4gLcKgwqDCoMKgwqDCoMKgIG9sZF9kbV9zdGF0ZSA9IGRtX2F0b21pY19nZXRfb2xk
X3N0YXRlKHN0YXRlKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgc3RhdGUt
Pm51bV9wcml2YXRlX29ianM7IGkrKykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGRybV9wcml2YXRlX29iaiAqb2JqID0gc3RhdGUtPnByaXZhdGVfb2Jqc1tpXS5wdHI7Cj4+
Pgo+Pj4gLcKgwqDCoMKgwqDCoMKgIGlmIChuZXdfZG1fc3RhdGUgJiYgb2xkX2RtX3N0YXRlKSB7
Cj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAobmV3X2RtX3N0YXRlLT5jb250ZXh0KQo+
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkY19yZWxlYXNlX3N0YXRlKG5ld19k
bV9zdGF0ZS0+Y29udGV4dCk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAob2JqLT5m
dW5jcyA9PSBhZGV2LT5kbS5hdG9taWNfb2JqLmZ1bmNzKSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGludCBqID0gc3RhdGUtPm51bV9wcml2YXRlX29ianMtMTsKPj4+Cj4+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuZXdfZG1fc3RhdGUtPmNvbnRleHQgPSBvbGRfZG1f
c3RhdGUtPmNvbnRleHQ7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtX2F0
b21pY19kZXN0cm95X3N0YXRlKG9iaiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRlX29ianNbaV0uc3RhdGUpOwo+Pj4gKwo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBJZiBpIGlzIG5vdCBhdCB0aGUg
ZW5kIG9mIHRoZSBhcnJheSB0aGVuIHRoZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgICogbGFzdCBlbGVtZW50IG5lZWRzIHRvIGJlIG1vdmVkIHRvIHdoZXJlIGkgd2FzCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBiZWZvcmUgdGhlIGFycmF5IGNh
biBzYWZlbHkgYmUgdHJ1bmNhdGVkLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICovCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpICE9IGopCj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPnByaXZhdGVf
b2Jqc1tpXSA9Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2pdOwo+Pj4KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChvbGRfZG1fc3RhdGUtPmNvbnRleHQpCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRjX3JldGFpbl9zdGF0ZShvbGRfZG1fc3RhdGUtPmNvbnRleHQpOwo+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2pdLnB0ciA9
IE5VTEw7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRl
X29ianNbal0uc3RhdGUgPSBOVUxMOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdGF0ZS0+cHJpdmF0ZV9vYmpzW2pdLm9sZF9zdGF0ZSA9IE5VTEw7Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0YXRlLT5wcml2YXRlX29ianNbal0ubmV3X3N0YXRlID0g
TlVMTDsKPj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RhdGUtPm51
bV9wcml2YXRlX29ianMgPSBqOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBi
cmVhazsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCB9Cj4+PiDCoMKgwqDCoMKgIH0KPj4+Cj4+PiAtLSAKPj4+IDIuMjcuMAo+Pj4KPj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWls
aW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
