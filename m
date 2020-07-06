Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962AF216107
	for <lists+amd-gfx@lfdr.de>; Mon,  6 Jul 2020 23:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6007A89C46;
	Mon,  6 Jul 2020 21:43:07 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F74889C46
 for <amd-gfx@lists.freedesktop.org>; Mon,  6 Jul 2020 21:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LKg4rt+bU5i6rqDwGiuQcqVuPnTLa7KN9xHjvHhGJgJwo3cAcIeMucT5cIDA4et0OuZZ8RqDQr63+O5p+u+gPnK7yeI1L4bv+mR6Iy8XeUNFobXlAcePuM0FDCVFpjdeIr9EpYT6V/fYoM0Ts3Cyuk3+Vi+ybjf8fnQWGyxCOgQPSs92H6LFmQkt2linb1QFeE7XO0b57Y4w0EGEx+dfQLTY7AfeHEqMS08wudkOSx/CGmGeoU34VRDHOgaaUvSPNulVYPruf5AUPk8hWZih0+LM+NWj4W2+7N2GOUkGXK9y8kQoNLGnD5vZf8DPn3B8OaJo8ESLwWIlrvG95V7WGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBSB4a/CxKHBwgEgtZQROq/h8ResKeTW+6UI4/LVwP4=;
 b=eFPYse6XxaTRjTyuj9gvchEz606nN9rArQDs4uN92/24lxvrDD8HtpMFkl4k15/reX/6uBNh4xZp82fx13tVP0OKJs0hag5cNc8sR9Scrlu0xw86/Nzv+FfzeR0e5Wi9ztd9LAx+fJRD/n+e41B65r0e2StMWHofD2GdiZpScsUlGufX89FAXnHAoiiPadSqhlvJESkxA8WNLD0oKjZfPD5/SKR0AqVMW1kx18VRsnKgNPakbQNkdIgY2LVZtslko08gif4muGKp5zibkJEXbT8OHaq7wbkMLl+XeBho+mEn08WIJLZkTlYqpnyiyjdW5LQR5/O2Lf6wL+AsI9MYLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aBSB4a/CxKHBwgEgtZQROq/h8ResKeTW+6UI4/LVwP4=;
 b=iOc/y3DyXtKxQWAVQ1mo3aMsQJX+Q5BrpJrRSskpB/NillvOCcFr3Y2j33xgMQvZS1ziE8U+vXI/nTjbHJUvhRdz6M8Sdu+XeDx55t+w+MyI7upFlGeMSRShqxgTleH9/rmh+7M/OGUuvuPdJ2NLv4yhcuC225cJife+qvSMOfg=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4431.namprd12.prod.outlook.com (2603:10b6:806:95::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Mon, 6 Jul
 2020 21:43:04 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::180c:9e60:d3cd:e89d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::180c:9e60:d3cd:e89d%3]) with mapi id 15.20.3153.029; Mon, 6 Jul 2020
 21:43:04 +0000
Subject: Re: [PATCH] drm/amdgpu: fix system hang issue during GPU reset
To: Dennis Li <Dennis.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 Alexander.Deucher@amd.com, Tao.Zhou1@amd.com, Hawking.Zhang@amd.com,
 Guchun.Chen@amd.com
References: <20200706100113.25141-1-Dennis.Li@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <34860e8d-d501-bda0-8b23-63f35b344322@amd.com>
Date: Mon, 6 Jul 2020 17:43:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <20200706100113.25141-1-Dennis.Li@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.53.25) by
 YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.22 via Frontend
 Transport; Mon, 6 Jul 2020 21:43:04 +0000
X-Originating-IP: [142.117.53.25]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2e72d7b1-7ddc-4e4c-200a-08d821f5905f
X-MS-TrafficTypeDiagnostic: SA0PR12MB4431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4431E117DC8F577BFFC5AB5892690@SA0PR12MB4431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04569283F9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGZ1kUNEZCSsKwM0TWbwDppUuTWZBGqXv4rUDJtaEuVJ4yCyDocCpG38au8H4HvZVcLDNrJtLfp+rWtUe6scOfzkbP/cCoE1WIzyzaHUiDE3zLFdgfUoXY2aX1hGBu8irjzz3X51N9XK5yodxdc330WfwqUHBhi6w5mgUK2hff+TdXjp8z75KeqMDmHMI8wI0p4ZbhjL/B32v6MXxv8d1hPRGZTy4of/JyQkWD7JHjt1xW3zhO4fiJW1sGUuoJOBRhK9W3VSdeQYl0B0Xknv4dld3kFrX7ckk5jX0mkOJP5PahIloTJWRLtUrGiGuhMoUNuB5R4CabCYe6qU9S+YEwqoXrJRFDUzvEeEb7sUNwuEYzumgnKkGbYe7QHUgxIP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(956004)(6636002)(83380400001)(36756003)(16576012)(66946007)(66556008)(66476007)(316002)(478600001)(31686004)(8676002)(30864003)(5660300002)(52116002)(44832011)(2616005)(6486002)(2906002)(16526019)(26005)(31696002)(186003)(8936002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: idZL7ebDhs3sKtvCFDVYXCe3QsFguE44v1vgs2cQ88xLmvPj04rzVBJnFZRZ4GQt1QB2zP2fgrU4V3aoQy66XsXYW7DKjOPq1iwcbIgEHQRRlSIRQjOalyyQ4LqgdEB9qjpq7DOdLr16T9Ot+rIEX3QModqcd/M9Kj9C0S4qwGDM9wcSzOK8lL22kMRa2c40Vizv82cO0WukGsZgHjyHNzotKmLKfHbKWJpW43bwQ9HNpEBs5tSH63Xh04LG7DFFKE31/CDiP718QW2uKYubAcG6qvkfYTBXlPxQEyXrA+ONRTtFD406YFgqiAKViIiDXTxwdeJQx7O0/lWYqlq/GzTb/1lEhv2l9P4MvlI744ta0igbx6yrLEvQwjymG7jERBnvXbrKKgSZ6E0FpnxYL40zaw23j/hHm7s9vlx1ReD2BKKtcxma5MWrwHbuDwV/POR1HAo1sts41j94D+pLlc3F36fxLTT7TQhLYHftI8U=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e72d7b1-7ddc-4e4c-200a-08d821f5905f
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2020 21:43:04.7361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MT0ae1rnJ9nLlCKEOu1KwxE31PTahY1DO/7bvz/C7ideTpsvwf+YL9Vg71wD9Zf91QyrzjBJE9NtuLlA5XSe4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4431
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CkFtIDIwMjAtMDctMDYgdW0gNjowMSBhLm0uIHNjaHJpZWIgRGVubmlzIExpOgo+IER1cmluZyBH
UFUgcmVzZXQsIGRyaXZlciBzaG91bGQgaG9sZCBvbiBhbGwgZXh0ZXJuYWwgYWNjZXNzIHRvCj4g
R1BVLCBvdGhlcndpc2UgcHNwIHdpbGwgcmFuZG9tbHkgZmFpbCB0byBkbyBwb3N0LCBhbmQgdGhl
biBjYXVzZQo+IHN5c3RlbSBoYW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogRGVubmlzIExpIDxkZW5u
aXMubGlAYW1kLmNvbT4KPiBDaGFuZ2UtSWQ6IEk3ZDVkNDFmOWM0MTk4YjkxN2Q3YjQ5NjA2YmEz
ODUwOTg4ZTViOTM2Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHUuaAo+IGluZGV4IDZj
N2RkMGE3MDdjOS4uMzRiZmMyYTE0N2ZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1LmgKPiBAQCAtOTY1LDcgKzk2NSw3IEBAIHN0cnVjdCBhbWRncHVfZGV2aWNlIHsKPiAgCj4g
IAlib29sICAgICAgICAgICAgICAgICAgICAgICAgICAgIGluX2dwdV9yZXNldDsKPiAgCWVudW0g
cHBfbXAxX3N0YXRlICAgICAgICAgICAgICAgbXAxX3N0YXRlOwo+IC0Jc3RydWN0IG11dGV4ICBs
b2NrX3Jlc2V0Owo+ICsJc3RydWN0IHJ3X3NlbWFwaG9yZQlyZXNldF9zZW07Cj4gIAlzdHJ1Y3Qg
YW1kZ3B1X2Rvb3JiZWxsX2luZGV4IGRvb3JiZWxsX2luZGV4Owo+ICAKPiAgCXN0cnVjdCBtdXRl
eAkJCW5vdGlmaWVyX2xvY2s7Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmQuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmQuYwo+IGluZGV4IGFkNTlhYzQ0MjNiOC4uNDEzOWM4MTM4OWE0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmQuYwo+IEBAIC02MTEsNyArNjExLDkg
QEAgaW50IGFtZGdwdV9hbWRrZmRfc3VibWl0X2liKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIGVudW0g
a2dkX2VuZ2luZV90eXBlIGVuZ2luZSwKPiAgCS8qIFRoaXMgd29ya3MgZm9yIE5PX0hXUy4gVE9E
TzogbmVlZCB0byBoYW5kbGUgd2l0aG91dCBrbm93aW5nIFZNSUQgKi8KPiAgCWpvYi0+dm1pZCA9
IHZtaWQ7Cj4gIAo+ICsJZG93bl9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwoKVGhpcyAoYW5kIG90
aGVyIGluc3RhbmNlcyBiZWxvdykgd2lsbCBpbnRyb2R1Y2Ugc29tZSBsb2NrIGRlcGVuZGVuY3kK
aXNzdWVzLiBBbnkgbG9jayB0aGF0IHlvdSB0YWtlIHVuZGVyIEtGRCdzIERRTSBsb2NrIHdpbGwg
aW5oZXJpdCB0aGUKcHJvYmxlbSB0aGF0IHlvdSBjYW4ndCByZWNsYWltIG1lbW9yeSB3aGlsZSBo
b2xkaW5nIGl0IGJlY2F1c2UgdGhlIERRTQpsb2NrIGlzIHRha2VuIGluIE1NVSBub3RpZmllcnMu
IFRoYXQgd2lsbCBhZmZlY3QgYW55IGF0dGVtcHRzIG9mCmFsbG9jYXRpbmcgbWVtb3J5IHdoaWxl
IGhvbGRpbmcgdGhlIHJlc2V0X3NlbS4KCkRRTSBhbHJlYWR5IGhhcyBhbiBpbnRlcm5hbCBmbGFn
IGRxbS0+aXNfcmVzZXR0aW5nIHRoYXQgaXMgc2V0IGluIHRoZQpLRkQgcHJlX3Jlc2V0IGNhbGxi
YWNrLiBJdCB3b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIHRoYXQgaW4gRFFNIHRvIHByZXZlbnQKYW55
IGNhbGxzIHRoYXQgYWNjZXNzIGhhcmR3YXJlLgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+ICAJcmV0
ID0gYW1kZ3B1X2liX3NjaGVkdWxlKHJpbmcsIDEsIGliLCBqb2IsICZmKTsKPiArCXVwX3JlYWQo
JmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAlpZiAocmV0KSB7Cj4gIAkJRFJNX0VSUk9SKCJhbWRncHU6
IGZhaWxlZCB0byBzY2hlZHVsZSBJQi5cbiIpOwo+ICAJCWdvdG8gZXJyX2liX3NjaGVkOwo+IEBA
IC02NDksNiArNjUxLDggQEAgaW50IGFtZGdwdV9hbWRrZmRfZmx1c2hfZ3B1X3RsYl92bWlkKHN0
cnVjdCBrZ2RfZGV2ICprZ2QsIHVpbnQxNl90IHZtaWQpCj4gIHsKPiAgCXN0cnVjdCBhbWRncHVf
ZGV2aWNlICphZGV2ID0gKHN0cnVjdCBhbWRncHVfZGV2aWNlICopa2dkOwo+ICAKPiArCWRvd25f
cmVhZCgmYWRldi0+cmVzZXRfc2VtKTsKPiArCj4gIAlpZiAoYWRldi0+ZmFtaWx5ID09IEFNREdQ
VV9GQU1JTFlfQUkpIHsKPiAgCQlpbnQgaTsKPiAgCj4gQEAgLTY1OCw2ICs2NjIsOCBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9mbHVzaF9ncHVfdGxiX3ZtaWQoc3RydWN0IGtnZF9kZXYgKmtnZCwgdWlu
dDE2X3Qgdm1pZCkKPiAgCQlhbWRncHVfZ21jX2ZsdXNoX2dwdV90bGIoYWRldiwgdm1pZCwgQU1E
R1BVX0dGWEhVQl8wLCAwKTsKPiAgCX0KPiAgCj4gKwl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0p
Owo+ICsKPiAgCXJldHVybiAwOwo+ICB9Cj4gIAo+IEBAIC02NjYsMTEgKzY3MiwxOCBAQCBpbnQg
YW1kZ3B1X2FtZGtmZF9mbHVzaF9ncHVfdGxiX3Bhc2lkKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHVp
bnQxNl90IHBhc2lkKQo+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSAoc3RydWN0IGFt
ZGdwdV9kZXZpY2UgKilrZ2Q7Cj4gIAljb25zdCB1aW50MzJfdCBmbHVzaF90eXBlID0gMDsKPiAg
CWJvb2wgYWxsX2h1YiA9IGZhbHNlOwo+ICsJaW50IHJldCA9IDA7Cj4gIAo+ICAJaWYgKGFkZXYt
PmZhbWlseSA9PSBBTURHUFVfRkFNSUxZX0FJKQo+ICAJCWFsbF9odWIgPSB0cnVlOwo+ICAKPiAt
CXJldHVybiBhbWRncHVfZ21jX2ZsdXNoX2dwdV90bGJfcGFzaWQoYWRldiwgcGFzaWQsIGZsdXNo
X3R5cGUsIGFsbF9odWIpOwo+ICsJZG93bl9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+ICsKPiAr
CXJldCA9IGFtZGdwdV9nbWNfZmx1c2hfZ3B1X3RsYl9wYXNpZChhZGV2LCBwYXNpZCwgZmx1c2hf
dHlwZSwgYWxsX2h1Yik7Cj4gKwo+ICsJdXBfcmVhZCgmYWRldi0+cmVzZXRfc2VtKTsKPiArCj4g
KwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+ICBib29sIGFtZGdwdV9hbWRrZmRfaGF2ZV9hdG9taWNz
X3N1cHBvcnQoc3RydWN0IGtnZF9kZXYgKmtnZCkKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92MTAuYwo+IGluZGV4IDY5MWM4OTcwNWJjZC4u
ZGI1ZDUzM2RkNDA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmRfZ2Z4X3YxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9nZnhfdjEwLmMKPiBAQCAtNTQyLDYgKzU0Miw3IEBAIHN0YXRpYyBpbnQg
a2dkX2hxZF9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwKPiAgCXVuc2ln
bmVkIGxvbmcgZW5kX2ppZmZpZXM7Cj4gIAl1aW50MzJfdCB0ZW1wOwo+ICAJc3RydWN0IHYxMF9j
b21wdXRlX21xZCAqbSA9IGdldF9tcWQobXFkKTsKPiArCWludCByZXQgPSAwOwo+ICAKPiAgCWlm
IChhZGV2LT5pbl9ncHVfcmVzZXQpCj4gIAkJcmV0dXJuIC1FSU87Cj4gQEAgLTU1MSw2ICs1NTIs
OCBAQCBzdGF0aWMgaW50IGtnZF9ocWRfZGVzdHJveShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lk
ICptcWQsCj4gIAlpbnQgcmV0cnk7Cj4gICNlbmRpZgo+ICAKPiArCWRvd25fcmVhZCgmYWRldi0+
cmVzZXRfc2VtKTsKPiArCj4gIAlhY3F1aXJlX3F1ZXVlKGtnZCwgcGlwZV9pZCwgcXVldWVfaWQp
Owo+ICAKPiAgCWlmIChtLT5jcF9ocWRfdm1pZCA9PSAwKQo+IEBAIC02MzMsMTQgKzYzNiwxNiBA
QCBzdGF0aWMgaW50IGtnZF9ocWRfZGVzdHJveShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICpt
cWQsCj4gIAkJCWJyZWFrOwo+ICAJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVuZF9qaWZmaWVz
KSkgewo+ICAJCQlwcl9lcnIoImNwIHF1ZXVlIHByZWVtcHRpb24gdGltZSBvdXQuXG4iKTsKPiAt
CQkJcmVsZWFzZV9xdWV1ZShrZ2QpOwo+IC0JCQlyZXR1cm4gLUVUSU1FOwo+ICsJCQlyZXQgPSAt
RVRJTUU7Cj4gKwkJCWdvdG8gcHJvX2VuZDsKPiAgCQl9Cj4gIAkJdXNsZWVwX3JhbmdlKDUwMCwg
MTAwMCk7Cj4gIAl9Cj4gIAo+ICtwcm9fZW5kOgo+ICAJcmVsZWFzZV9xdWV1ZShrZ2QpOwo+IC0J
cmV0dXJuIDA7Cj4gKwl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+ICsJcmV0dXJuIHJldDsK
PiAgfQo+ICAKPiAgc3RhdGljIGludCBrZ2RfaHFkX3NkbWFfZGVzdHJveShzdHJ1Y3Qga2dkX2Rl
diAqa2dkLCB2b2lkICptcWQsCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hbWRrZmRfZ2Z4X3Y3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfYW1ka2ZkX2dmeF92Ny5jCj4gaW5kZXggMGI3ZTc4NzQ4NTQwLi5jZjI3ZmU1MDkxYWEg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9n
ZnhfdjcuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9hbWRrZmRf
Z2Z4X3Y3LmMKPiBAQCAtNDI0LDEwICs0MjQsMTMgQEAgc3RhdGljIGludCBrZ2RfaHFkX2Rlc3Ry
b3koc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAqbXFkLAo+ICAJZW51bSBocWRfZGVxdWV1ZV9y
ZXF1ZXN0X3R5cGUgdHlwZTsKPiAgCXVuc2lnbmVkIGxvbmcgZmxhZ3MsIGVuZF9qaWZmaWVzOwo+
ICAJaW50IHJldHJ5Owo+ICsJaW50IHJldCA9IDA7Cj4gIAo+ICAJaWYgKGFkZXYtPmluX2dwdV9y
ZXNldCkKPiAgCQlyZXR1cm4gLUVJTzsKPiAgCj4gKwlkb3duX3JlYWQoJmFkZXYtPnJlc2V0X3Nl
bSk7Cj4gKwo+ICAJYWNxdWlyZV9xdWV1ZShrZ2QsIHBpcGVfaWQsIHF1ZXVlX2lkKTsKPiAgCVdS
RUczMihtbUNQX0hRRF9QUV9ET09SQkVMTF9DT05UUk9MLCAwKTsKPiAgCj4gQEAgLTUwNiwxNCAr
NTA5LDE2IEBAIHN0YXRpYyBpbnQga2dkX2hxZF9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICprZ2Qs
IHZvaWQgKm1xZCwKPiAgCQkJYnJlYWs7Cj4gIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5k
X2ppZmZpZXMpKSB7Cj4gIAkJCXByX2VycigiY3AgcXVldWUgcHJlZW1wdGlvbiB0aW1lIG91dFxu
Iik7Cj4gLQkJCXJlbGVhc2VfcXVldWUoa2dkKTsKPiAtCQkJcmV0dXJuIC1FVElNRTsKPiArCQkJ
cmV0ID0gLUVUSU1FOwo+ICsJCQlnb3RvIHByb19lbmQ7Cj4gIAkJfQo+ICAJCXVzbGVlcF9yYW5n
ZSg1MDAsIDEwMDApOwo+ICAJfQo+ICAKPiArcHJvX2VuZDoKPiAgCXJlbGVhc2VfcXVldWUoa2dk
KTsKPiAtCXJldHVybiAwOwo+ICsJdXBfcmVhZCgmYWRldi0+cmVzZXRfc2VtKTsKPiArCXJldHVy
biByZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyBpbnQga2dkX2hxZF9zZG1hX2Rlc3Ryb3koc3RydWN0
IGtnZF9kZXYgKmtnZCwgdm9pZCAqbXFkLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92OC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhfdjguYwo+IGluZGV4IGNjZDYzNWI4MTJiNS4uYmM4ZTA3
MTg2YTg1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9h
bWRrZmRfZ2Z4X3Y4LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
YW1ka2ZkX2dmeF92OC5jCj4gQEAgLTQyMCwxMCArNDIwLDEzIEBAIHN0YXRpYyBpbnQga2dkX2hx
ZF9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwKPiAgCXVuc2lnbmVkIGxv
bmcgZmxhZ3MsIGVuZF9qaWZmaWVzOwo+ICAJaW50IHJldHJ5Owo+ICAJc3RydWN0IHZpX21xZCAq
bSA9IGdldF9tcWQobXFkKTsKPiArCWludCByZXQgPSAwOwo+ICAKPiAgCWlmIChhZGV2LT5pbl9n
cHVfcmVzZXQpCj4gIAkJcmV0dXJuIC1FSU87Cj4gIAo+ICsJZG93bl9yZWFkKCZhZGV2LT5yZXNl
dF9zZW0pOwo+ICsKPiAgCWFjcXVpcmVfcXVldWUoa2dkLCBwaXBlX2lkLCBxdWV1ZV9pZCk7Cj4g
IAo+ICAJaWYgKG0tPmNwX2hxZF92bWlkID09IDApCj4gQEAgLTUwNCwxNCArNTA3LDE2IEBAIHN0
YXRpYyBpbnQga2dkX2hxZF9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKm1xZCwK
PiAgCQkJYnJlYWs7Cj4gIAkJaWYgKHRpbWVfYWZ0ZXIoamlmZmllcywgZW5kX2ppZmZpZXMpKSB7
Cj4gIAkJCXByX2VycigiY3AgcXVldWUgcHJlZW1wdGlvbiB0aW1lIG91dC5cbiIpOwo+IC0JCQly
ZWxlYXNlX3F1ZXVlKGtnZCk7Cj4gLQkJCXJldHVybiAtRVRJTUU7Cj4gKwkJCXJldCA9IC1FVElN
RTsKPiArCQkJZ290byBwcm9fZW5kOwo+ICAJCX0KPiAgCQl1c2xlZXBfcmFuZ2UoNTAwLCAxMDAw
KTsKPiAgCX0KPiAgCj4gK3Byb19lbmQ6Cj4gIAlyZWxlYXNlX3F1ZXVlKGtnZCk7Cj4gLQlyZXR1
cm4gMDsKPiArCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4gKwlyZXR1cm4gcmV0Owo+ICB9
Cj4gIAo+ICBzdGF0aWMgaW50IGtnZF9ocWRfc2RtYV9kZXN0cm95KHN0cnVjdCBrZ2RfZGV2ICpr
Z2QsIHZvaWQgKm1xZCwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2FtZGtmZF9nZnhfdjkuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9hbWRrZmRfZ2Z4X3Y5LmMKPiBpbmRleCBkZjg0MWMyYWM1ZTcuLjM0MWFkNjUyZDkxMCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYW1ka2ZkX2dmeF92
OS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9nZnhf
djkuYwo+IEBAIC01NDAsMTAgKzU0MCwxMyBAQCBpbnQga2dkX2dmeF92OV9ocWRfZGVzdHJveShz
dHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQsCj4gIAl1bnNpZ25lZCBsb25nIGVuZF9qaWZm
aWVzOwo+ICAJdWludDMyX3QgdGVtcDsKPiAgCXN0cnVjdCB2OV9tcWQgKm0gPSBnZXRfbXFkKG1x
ZCk7Cj4gKwlpbnQgcmV0ID0gMDsKPiAgCj4gIAlpZiAoYWRldi0+aW5fZ3B1X3Jlc2V0KQo+ICAJ
CXJldHVybiAtRUlPOwo+ICAKPiArCWRvd25fcmVhZCgmYWRldi0+cmVzZXRfc2VtKTsKPiArCj4g
IAlhY3F1aXJlX3F1ZXVlKGtnZCwgcGlwZV9pZCwgcXVldWVfaWQpOwo+ICAKPiAgCWlmIChtLT5j
cF9ocWRfdm1pZCA9PSAwKQo+IEBAIC01NzAsMTQgKzU3MywxNiBAQCBpbnQga2dkX2dmeF92OV9o
cWRfZGVzdHJveShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQsCj4gIAkJCWJyZWFrOwo+
ICAJCWlmICh0aW1lX2FmdGVyKGppZmZpZXMsIGVuZF9qaWZmaWVzKSkgewo+ICAJCQlwcl9lcnIo
ImNwIHF1ZXVlIHByZWVtcHRpb24gdGltZSBvdXQuXG4iKTsKPiAtCQkJcmVsZWFzZV9xdWV1ZShr
Z2QpOwo+IC0JCQlyZXR1cm4gLUVUSU1FOwo+ICsJCQlyZXQgPSAtRVRJTUU7Cj4gKwkJCWdvdG8g
cHJvX2VuZDsKPiAgCQl9Cj4gIAkJdXNsZWVwX3JhbmdlKDUwMCwgMTAwMCk7Cj4gIAl9Cj4gIAo+
ICtwcm9fZW5kOgo+ICAJcmVsZWFzZV9xdWV1ZShrZ2QpOwo+IC0JcmV0dXJuIDA7Cj4gKwl1cF9y
ZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+ICsJcmV0dXJuIHJldDsKPiAgfQo+ICAKPiAgc3RhdGlj
IGludCBrZ2RfaHFkX3NkbWFfZGVzdHJveShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICptcWQs
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2Zz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCj4gaW5kZXgg
YWVhZGE3YzlmYmVhLi5kOGYyNjRjNDdiODYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKPiBAQCAtMTAwLDE0ICsxMDAsMTQgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGVidWdmc19hdXRvZHVtcF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVj
dCBmaWxlICpmaWxlKQo+ICAKPiAgCWZpbGUtPnByaXZhdGVfZGF0YSA9IGFkZXY7Cj4gIAo+IC0J
bXV0ZXhfbG9jaygmYWRldi0+bG9ja19yZXNldCk7Cj4gKwlkb3duX3JlYWQoJmFkZXYtPnJlc2V0
X3NlbSk7Cj4gIAlpZiAoYWRldi0+YXV0b2R1bXAuZHVtcGluZy5kb25lKSB7Cj4gIAkJcmVpbml0
X2NvbXBsZXRpb24oJmFkZXYtPmF1dG9kdW1wLmR1bXBpbmcpOwo+ICAJCXJldCA9IDA7Cj4gIAl9
IGVsc2Ugewo+ICAJCXJldCA9IC1FQlVTWTsKPiAgCX0KPiAtCW11dGV4X3VubG9jaygmYWRldi0+
bG9ja19yZXNldCk7Cj4gKwl1cF9yZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+ICAKPiAgCXJldHVy
biByZXQ7Cj4gIH0KPiBAQCAtMTE4OCw3ICsxMTg4LDcgQEAgc3RhdGljIGludCBhbWRncHVfZGVi
dWdmc190ZXN0X2liKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKPiAgCX0KPiAgCj4g
IAkvKiBBdm9pZCBhY2NpZGVudGx5IHVucGFya2luZyB0aGUgc2NoZWQgdGhyZWFkIGR1cmluZyBH
UFUgcmVzZXQgKi8KPiAtCW11dGV4X2xvY2soJmFkZXYtPmxvY2tfcmVzZXQpOwo+ICsJZG93bl9y
ZWFkKCZhZGV2LT5yZXNldF9zZW0pOwo+ICAKPiAgCS8qIGhvbGQgb24gdGhlIHNjaGVkdWxlciAq
Lwo+ICAJZm9yIChpID0gMDsgaSA8IEFNREdQVV9NQVhfUklOR1M7IGkrKykgewo+IEBAIC0xMjE1
LDcgKzEyMTUsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9kZWJ1Z2ZzX3Rlc3RfaWIoc3RydWN0IHNl
cV9maWxlICptLCB2b2lkICpkYXRhKQo+ICAJCWt0aHJlYWRfdW5wYXJrKHJpbmctPnNjaGVkLnRo
cmVhZCk7Cj4gIAl9Cj4gIAo+IC0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsKPiAr
CXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAo+ICAJcG1fcnVudGltZV9tYXJrX2xhc3Rf
YnVzeShkZXYtPmRldik7Cj4gIAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChkZXYtPmRldik7
Cj4gQEAgLTEzOTUsNyArMTM5NSw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RlYnVnZnNfaWJfcHJl
ZW1wdCh2b2lkICpkYXRhLCB1NjQgdmFsKQo+ICAJCXJldHVybiAtRU5PTUVNOwo+ICAKPiAgCS8q
IEF2b2lkIGFjY2lkZW50bHkgdW5wYXJraW5nIHRoZSBzY2hlZCB0aHJlYWQgZHVyaW5nIEdQVSBy
ZXNldCAqLwo+IC0JbXV0ZXhfbG9jaygmYWRldi0+bG9ja19yZXNldCk7Cj4gKwlkb3duX3JlYWQo
JmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAo+ICAJLyogc3RvcCB0aGUgc2NoZWR1bGVyICovCj4gIAlr
dGhyZWFkX3BhcmsocmluZy0+c2NoZWQudGhyZWFkKTsKPiBAQCAtMTQzNiw3ICsxNDM2LDcgQEAg
c3RhdGljIGludCBhbWRncHVfZGVidWdmc19pYl9wcmVlbXB0KHZvaWQgKmRhdGEsIHU2NCB2YWwp
Cj4gIAkvKiByZXN0YXJ0IHRoZSBzY2hlZHVsZXIgKi8KPiAgCWt0aHJlYWRfdW5wYXJrKHJpbmct
PnNjaGVkLnRocmVhZCk7Cj4gIAo+IC0JbXV0ZXhfdW5sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsK
PiArCXVwX3JlYWQoJmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAo+ICAJdHRtX2JvX3VubG9ja19kZWxh
eWVkX3dvcmtxdWV1ZSgmYWRldi0+bW1hbi5iZGV2LCByZXNjaGVkKTsKPiAgCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+IGluZGV4IDI4NThjMDlmZDhjMC4u
YmM5MDJjNTljMWMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZXZpY2UuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZXZpY2UuYwo+IEBAIC0zMDQ0LDcgKzMwNDQsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0
cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAJbXV0ZXhfaW5pdCgmYWRldi0+bW5fbG9jayk7
Cj4gIAltdXRleF9pbml0KCZhZGV2LT52aXJ0LnZmX2Vycm9ycy5sb2NrKTsKPiAgCWhhc2hfaW5p
dChhZGV2LT5tbl9oYXNoKTsKPiAtCW11dGV4X2luaXQoJmFkZXYtPmxvY2tfcmVzZXQpOwo+ICsJ
aW5pdF9yd3NlbSgmYWRldi0+cmVzZXRfc2VtKTsKPiAgCW11dGV4X2luaXQoJmFkZXYtPnBzcC5t
dXRleCk7Cj4gIAltdXRleF9pbml0KCZhZGV2LT5ub3RpZmllcl9sb2NrKTsKPiAgCj4gQEAgLTQx
NTAsMTAgKzQxNTAsMTAgQEAgc3RhdGljIGludCBhbWRncHVfZG9fYXNpY19yZXNldChzdHJ1Y3Qg
YW1kZ3B1X2hpdmVfaW5mbyAqaGl2ZSwKPiAgc3RhdGljIGJvb2wgYW1kZ3B1X2RldmljZV9sb2Nr
X2FkZXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIGJvb2wgdHJ5bG9jaykKPiAgewo+ICAJ
aWYgKHRyeWxvY2spIHsKPiAtCQlpZiAoIW11dGV4X3RyeWxvY2soJmFkZXYtPmxvY2tfcmVzZXQp
KQo+ICsJCWlmICghZG93bl93cml0ZV90cnlsb2NrKCZhZGV2LT5yZXNldF9zZW0pKQo+ICAJCQly
ZXR1cm4gZmFsc2U7Cj4gIAl9IGVsc2UKPiAtCQltdXRleF9sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0
KTsKPiArCQlkb3duX3dyaXRlKCZhZGV2LT5yZXNldF9zZW0pOwo+ICAKPiAgCWF0b21pY19pbmMo
JmFkZXYtPmdwdV9yZXNldF9jb3VudGVyKTsKPiAgCWFkZXYtPmluX2dwdV9yZXNldCA9IHRydWU7
Cj4gQEAgLTQxNzcsNyArNDE3Nyw3IEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9kZXZpY2VfdW5sb2Nr
X2FkZXYoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCj4gIAlhbWRncHVfdmZfZXJyb3JfdHJh
bnNfYWxsKGFkZXYpOwo+ICAJYWRldi0+bXAxX3N0YXRlID0gUFBfTVAxX1NUQVRFX05PTkU7Cj4g
IAlhZGV2LT5pbl9ncHVfcmVzZXQgPSBmYWxzZTsKPiAtCW11dGV4X3VubG9jaygmYWRldi0+bG9j
a19yZXNldCk7Cj4gKwl1cF93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsKPiAgfQo+ICAKPiAgc3Rh
dGljIHZvaWQgYW1kZ3B1X2RldmljZV9yZXN1bWVfZGlzcGxheV9hdWRpbyhzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X2pvYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4g
aW5kZXggMjk3NWM0YTZlNTgxLi5kNGM2OWY5NTc3YTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2pvYi5jCj4gQEAgLTIyNSw4ICsyMjUsMTAgQEAgc3RhdGljIHN0cnVj
dCBkbWFfZmVuY2UgKmFtZGdwdV9qb2JfcnVuKHN0cnVjdCBkcm1fc2NoZWRfam9iICpzY2hlZF9q
b2IpCj4gIAlpZiAoZmluaXNoZWQtPmVycm9yIDwgMCkgewo+ICAJCURSTV9JTkZPKCJTa2lwIHNj
aGVkdWxpbmcgSUJzIVxuIik7Cj4gIAl9IGVsc2Ugewo+ICsJCWRvd25fcmVhZCgmcmluZy0+YWRl
di0+cmVzZXRfc2VtKTsKPiAgCQlyID0gYW1kZ3B1X2liX3NjaGVkdWxlKHJpbmcsIGpvYi0+bnVt
X2licywgam9iLT5pYnMsIGpvYiwKPiAgCQkJCSAgICAgICAmZmVuY2UpOwo+ICsJCXVwX3JlYWQo
JnJpbmctPmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAkJaWYgKHIpCj4gIAkJCURSTV9FUlJPUigiRXJy
b3Igc2NoZWR1bGluZyBJQnMgKCVkKVxuIiwgcik7Cj4gIAl9Cj4gQEAgLTIzNyw2ICsyMzksNyBA
QCBzdGF0aWMgc3RydWN0IGRtYV9mZW5jZSAqYW1kZ3B1X2pvYl9ydW4oc3RydWN0IGRybV9zY2hl
ZF9qb2IgKnNjaGVkX2pvYikKPiAgCWFtZGdwdV9qb2JfZnJlZV9yZXNvdXJjZXMoam9iKTsKPiAg
Cj4gIAlmZW5jZSA9IHIgPyBFUlJfUFRSKHIpIDogZmVuY2U7Cj4gKwo+ICAJcmV0dXJuIGZlbmNl
Owo+ICB9Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfcmluZy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3JpbmcuYwo+IGlu
ZGV4IDEzZWE4ZWJjNDIxYy4uMzhhNzUxZjdkODg5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yaW5nLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfcmluZy5jCj4gQEAgLTEyMSw2ICsxMjEsNyBAQCB2b2lkIGFtZGdwdV9y
aW5nX2dlbmVyaWNfcGFkX2liKHN0cnVjdCBhbWRncHVfcmluZyAqcmluZywgc3RydWN0IGFtZGdw
dV9pYiAqaWIpCj4gIHZvaWQgYW1kZ3B1X3JpbmdfY29tbWl0KHN0cnVjdCBhbWRncHVfcmluZyAq
cmluZykKPiAgewo+ICAJdWludDMyX3QgY291bnQ7Cj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IHJpbmctPmFkZXY7Cj4gIAo+ICAJLyogV2UgcGFkIHRvIG1hdGNoIGZldGNoIHNpemUg
Ki8KPiAgCWNvdW50ID0gcmluZy0+ZnVuY3MtPmFsaWduX21hc2sgKyAxIC0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L214Z3B1X2FpLmMKPiBpbmRleCA1ZmQ2N2UxY2MyYTAuLjk3ZjMzNTQwYWEw
MiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9teGdwdV9haS5jCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVfYWkuYwo+IEBAIC0yNDQsMTEg
KzI0NCwxMSBAQCBzdGF0aWMgdm9pZCB4Z3B1X2FpX21haWxib3hfZmxyX3dvcmsoc3RydWN0IHdv
cmtfc3RydWN0ICp3b3JrKQo+ICAJICogb3RoZXJ3aXNlIHRoZSBtYWlsYm94IG1zZyB3aWxsIGJl
IHJ1aW5lZC9yZXNldGVkIGJ5Cj4gIAkgKiB0aGUgVkYgRkxSLgo+ICAJICoKPiAtCSAqIHdlIGNh
biB1bmxvY2sgdGhlIGxvY2tfcmVzZXQgdG8gYWxsb3cgImFtZGdwdV9qb2JfdGltZWRvdXQiCj4g
KwkgKiB3ZSBjYW4gdW5sb2NrIHRoZSByZXNldF9zZW0gdG8gYWxsb3cgImFtZGdwdV9qb2JfdGlt
ZWRvdXQiCj4gIAkgKiB0byBydW4gZ3B1X3JlY292ZXIoKSBhZnRlciBGTFJfTk9USUZJQ0FUSU9O
X0NNUEwgcmVjZWl2ZWQKPiAgCSAqIHdoaWNoIG1lYW5zIGhvc3Qgc2lkZSBoYWQgZmluaXNoZWQg
dGhpcyBWRidzIEZMUi4KPiAgCSAqLwo+IC0JbG9ja2VkID0gbXV0ZXhfdHJ5bG9jaygmYWRldi0+
bG9ja19yZXNldCk7Cj4gKwlsb2NrZWQgPSBkb3duX3dyaXRlX3RyeWxvY2soJmFkZXYtPnJlc2V0
X3NlbSk7Cj4gIAlpZiAobG9ja2VkKQo+ICAJCWFkZXYtPmluX2dwdV9yZXNldCA9IHRydWU7Cj4g
IAo+IEBAIC0yNjMsNyArMjYzLDcgQEAgc3RhdGljIHZvaWQgeGdwdV9haV9tYWlsYm94X2Zscl93
b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgZmxyX2RvbmU6Cj4gIAlpZiAobG9ja2Vk
KSB7Cj4gIAkJYWRldi0+aW5fZ3B1X3Jlc2V0ID0gZmFsc2U7Cj4gLQkJbXV0ZXhfdW5sb2NrKCZh
ZGV2LT5sb2NrX3Jlc2V0KTsKPiArCQl1cF93cml0ZSgmYWRldi0+cmVzZXRfc2VtKTsKPiAgCX0K
PiAgCj4gIAkvKiBUcmlnZ2VyIHJlY292ZXJ5IGZvciB3b3JsZCBzd2l0Y2ggZmFpbHVyZSBpZiBu
byBURFIgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhncHVf
bnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L214Z3B1X252LmMKPiBpbmRleCBjZTJi
ZjFmYjc5ZWQuLjQ4NGQ2MWMyMjM5NiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9teGdwdV9udi5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvbXhn
cHVfbnYuYwo+IEBAIC0yNjUsMTEgKzI2NSwxMSBAQCBzdGF0aWMgdm9pZCB4Z3B1X252X21haWxi
b3hfZmxyX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJICogb3RoZXJ3aXNlIHRo
ZSBtYWlsYm94IG1zZyB3aWxsIGJlIHJ1aW5lZC9yZXNldGVkIGJ5Cj4gIAkgKiB0aGUgVkYgRkxS
Lgo+ICAJICoKPiAtCSAqIHdlIGNhbiB1bmxvY2sgdGhlIGxvY2tfcmVzZXQgdG8gYWxsb3cgImFt
ZGdwdV9qb2JfdGltZWRvdXQiCj4gKwkgKiB3ZSBjYW4gdW5sb2NrIHRoZSByZXNldF9zZW0gdG8g
YWxsb3cgImFtZGdwdV9qb2JfdGltZWRvdXQiCj4gIAkgKiB0byBydW4gZ3B1X3JlY292ZXIoKSBh
ZnRlciBGTFJfTk9USUZJQ0FUSU9OX0NNUEwgcmVjZWl2ZWQKPiAgCSAqIHdoaWNoIG1lYW5zIGhv
c3Qgc2lkZSBoYWQgZmluaXNoZWQgdGhpcyBWRidzIEZMUi4KPiAgCSAqLwo+IC0JbG9ja2VkID0g
bXV0ZXhfdHJ5bG9jaygmYWRldi0+bG9ja19yZXNldCk7Cj4gKwlsb2NrZWQgPSBkb3duX3dyaXRl
X3RyeWxvY2soJmFkZXYtPnJlc2V0X3NlbSk7Cj4gIAlpZiAobG9ja2VkKQo+ICAJCWFkZXYtPmlu
X2dwdV9yZXNldCA9IHRydWU7Cj4gIAo+IEBAIC0yODQsNyArMjg0LDcgQEAgc3RhdGljIHZvaWQg
eGdwdV9udl9tYWlsYm94X2Zscl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKPiAgZmxy
X2RvbmU6Cj4gIAlpZiAobG9ja2VkKSB7Cj4gIAkJYWRldi0+aW5fZ3B1X3Jlc2V0ID0gZmFsc2U7
Cj4gLQkJbXV0ZXhfdW5sb2NrKCZhZGV2LT5sb2NrX3Jlc2V0KTsKPiArCQl1cF93cml0ZSgmYWRl
di0+cmVzZXRfc2VtKTsKPiAgCX0KPiAgCj4gIAkvKiBUcmlnZ2VyIHJlY292ZXJ5IGZvciB3b3Js
ZCBzd2l0Y2ggZmFpbHVyZSBpZiBubyBURFIgKi8KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hbWQtZ2Z4Cg==
