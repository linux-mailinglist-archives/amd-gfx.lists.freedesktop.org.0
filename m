Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3EB292C9C
	for <lists+amd-gfx@lfdr.de>; Mon, 19 Oct 2020 19:24:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED846E94F;
	Mon, 19 Oct 2020 17:24:33 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2067.outbound.protection.outlook.com [40.107.94.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38BE76E94F
 for <amd-gfx@lists.freedesktop.org>; Mon, 19 Oct 2020 17:24:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDfkgTpABxGbWK6K199x/oz67k8a1u2YRBb/cSt3T2RN26kQ0THIOsX3lrdwZJKgCGYI/+mUOEBiAOrt/hSfYd5z6Ivk3N/EZfCoHE4ILFxDR7JjgcbWQdnPxs+ac/A0Ota/bPibI831pVWpKkq5vn/Bng+rjeU2+3qAmYc+L6kp+jEkYus9EIBIqqV4USHppaPppsECIKKYN6B4//ftFW9HMadL+O4yEFJddvzjA+NHoRpBz4AoqKcHaBMyfbmB9LqGw5ij8LhS9ZYVljNhG4BS95gDLHzzG5ZJ5xgIiE0/kcqkAgdZAla1AVH4/QxMwy7XMRrr6TFpCeg3sSKUvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j4zVSkstDuQvINJWJtXUTSsmJInDWIV/254SMdga2I=;
 b=C8nLV574P42ByJwIikAOBCLUYgpOZrF0fg6DuJVPr4P0e+wOofdB4NW/HfLdaLOS5yoFlx46fLKEuyzYzJsJxjIW1LmQz7FCjX6S7/UqY2jLtZM/DRF6CyfelhurQnKKL6kXSDB9NWlejqTod13pHEWhdcMgcpo3pCdbe4yi7n28A1LryScMrCbQPGbx4tYtJUq9EiCvc2mubsn3HA9tlCkjtVMsUv42SWP3U2gbs7ot3n7bdi9UHuA2ofavEX48fH402BNUBxi7A9pRmcxdZA0KgrBww0N1u5FYVruitj3ARg5s82OmAJBRgW4DhyFE3sFKvTXwJ6X2JrU7aL3tTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j4zVSkstDuQvINJWJtXUTSsmJInDWIV/254SMdga2I=;
 b=CSqSbfRKmGZdUext8i4H5ionic3REwUgXy4q6HiLI1RngeV0xOIvTPdv/7IxfJ6apHM2O9IBQWLcnrGJeLGxhJFh1SYfKudKvMBhrnCD6f0LLhzJ8knAux4csTLXpDZ2fCnhEkyFlsfuwPYLoupYfgnnmbydXqRTtThBNUd0H+8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4945.namprd12.prod.outlook.com (2603:10b6:208:1c4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.22; Mon, 19 Oct
 2020 17:24:30 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::b07d:ede5:2f45:5de8%9]) with mapi id 15.20.3477.028; Mon, 19 Oct 2020
 17:24:30 +0000
Subject: Re: [PATCH 2/2] drm/amdgpu: nuke amdgpu_vm_bo_split_mapping v2
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx@lists.freedesktop.org
References: <20201017120737.2430-1-christian.koenig@amd.com>
 <20201017120737.2430-2-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <55f3d361-ea9c-469e-7da3-9cdaf4ce3594@amd.com>
Date: Mon, 19 Oct 2020 13:24:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201017120737.2430-2-christian.koenig@amd.com>
Content-Language: en-US
X-Originating-IP: [142.116.113.11]
X-ClientProxiedBy: YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::31) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.113.11) by
 YTXPR0101CA0018.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3477.20 via Frontend Transport; Mon, 19 Oct 2020 17:24:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c17b3cbd-7024-40d7-a32a-08d87453d697
X-MS-TrafficTypeDiagnostic: BL0PR12MB4945:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4945F4FE9AECB24FFB51341D921E0@BL0PR12MB4945.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q91Jruf0OAV+WLf+0ESQ3lXibGZlFa69tnHVIRbGu/qudjzMwl9sUyrBdcrXmcao7m0TkKJkIWEu2SboHFtS/OL/Y2fI01QTad7Rh7u+9iwuJLoh220t+yR/Eza3HvWAIqdg9vTMPaoodY3NDMaQczHqCOlpssKJrkPbjqUwA0Pc5ql5GKgRuTmGjo6LpLKNqGbmLpK4IuvAHCLqWxDrUFd25orJS9SM3zHrDeiScV7giCmijlmFEU1uvwBGIbGsFJ9CY6PeF2Bifgx/UoQBFbx4MV4LpzrxVzEFXbOR62gXAtPExbthwMuCJs6vl20usF7K9UVKqQD8oJAGXhsUR1Y6oOPOisdFNns4SpulR5hqbyNEuI98uodFagFAV5OK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(2906002)(6486002)(16526019)(186003)(478600001)(16576012)(31696002)(26005)(316002)(52116002)(66556008)(66946007)(66476007)(4001150100001)(44832011)(31686004)(5660300002)(86362001)(956004)(36756003)(66574015)(2616005)(83380400001)(8676002)(8936002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: SD+Y+Phz1Ba4IDEM9c/V7/8tFkx1NSlwLYT6lCEsSGLLXog7OtH4RX4MPZO1fUN7rI/YbcIqenFwgnEIPkeCKQwwdlPTJeyBQLeUR1VQ/1AJQUHSkQXdvtGmmRXExqsmq5aPoAnHyUrtXdiDuza4QmbDufY9Jf0iYNnl+d82Py3GI1luSinDrjC6qiTyWy6D6E4/Ecp5ek1LKzWIqICrLJdf7p1R1TIXZozocEmMeYurv3G4SzOmCTS1wVBRf6jDBhlYsLVRy1j30t4LFijUkMBy4agF9shiC0dAAWezj/h32xAIZlQARvmdIBNcmaNZSJcBoZms65fzoRShj/mPuWvyJa1HIHc/oytbweYFCrTHLs1yCSwuZACwHVpNdIOWQSsv5Kxqamf1Y9cwM3ehxkOC1GgEfcBvMlSJTI3WpC5iEqnqOdaAW2FyXCIKlFL5tkrEYwAS33xDmWp+4VVf0OwFGZEMptDjHmE7f22IOVTDy/lU6qtPeT/0ydZduxhHAqLgxxY5W2XRdjsqqSfhqjDFS4SmIGghzNUGkjArY3mYCCvUatVVUSPQZ4WsKQvQRA+mAfzv6MCF6fa4eDRmwssMlWUCZAAWCkUDtpRlbNpkzB6r1jYk6FdXqcJhZ+hVDv0PUAkB4OzE10d0fUT/Rg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17b3cbd-7024-40d7-a32a-08d87453d697
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2020 17:24:30.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sh29eS5F6GsHVbrN582aA+nNGaV5xRRFUa/YpfKykVFEDaU7ZQwVw5PODi5xt5sa0lcC/44SmkjOxzLzSefpRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4945
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

QW0gMjAyMC0xMC0xNyB1bSA4OjA3IGEubS4gc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IE1l
cmdlIHRoZSBmdW5jdGlvbmFsaXR5IG1vc3RseSBpbnRvIGFtZGdwdV92bV9ib191cGRhdGVfbWFw
cGluZy4KPgo+IFRoaXMgd2F5IHdlIGNhbiBldmVuIGhhbmRsZSBzbWFsbCBjb250aWd1b3VzIHN5
c3RlbSBwYWdlcyB3aXRob3V0Cj4gdG8gbXVjaCBleHRyYSBDUFUgb3ZlcmhlYWQuCj4KPiB2Mjog
Zml4IHR5cG8sIGtlZXAgdGhlIGN1cnNvciBhcyBpdCBpcyBmb3Igbm93Cj4KPiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gUmV2aWV3
ZWQtYnk6IE1hZGhhdiBDaGF1aGFuIDxtYWRoYXYuY2hhdWhhbkBhbWQuY29tPiAodjEpCkkgZ3Vl
c3MgdGhlIHNwZWVkdXAgY29tZXMgZnJvbSB0aGUgbG9ja2luZy9wcmVwYXJlL2NvbW1pdCBvdmVy
aGVhZCBpbgphbWRncHVfdm1fdXBkYXRlX21hcHBpbmcgdGhhdCBpcyBub3cgZ2V0dGluZyBjYWxs
ZWQgbGVzcyBmcmVxdWVudGx5IGFuZApkb2VzIG1vcmUgd29yayBpbiBhIHNpbmdsZSBjYWxsLgoK
UmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgoKCj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jIHwgMTgyICsrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyks
IDEwMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5j
Cj4gaW5kZXggM2NkOTQ5YWFkNTAwLi4wZDRhN2Q2ZDM4NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+IEBAIC0xNTcwLDcgKzE1NzAsOCBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBh
cmFtcywKPiAgLyoqCj4gICAqIGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyAtIHVwZGF0ZSBh
IG1hcHBpbmcgaW4gdGhlIHZtIHBhZ2UgdGFibGUKPiAgICoKPiAtICogQGFkZXY6IGFtZGdwdV9k
ZXZpY2UgcG9pbnRlcgo+ICsgKiBAYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyIG9mIHRoZSBW
TQo+ICsgKiBAYm9fYWRldjogYW1kZ3B1X2RldmljZSBwb2ludGVyIG9mIHRoZSBtYXBwZWQgQk8K
PiAgICogQHZtOiByZXF1ZXN0ZWQgdm0KPiAgICogQGltbWVkaWF0ZTogaW1tZWRpYXRlIHN1Ym1p
c3Npb24gaW4gYSBwYWdlIGZhdWx0Cj4gICAqIEB1bmxvY2tlZDogdW5sb2NrZWQgaW52YWxpZGF0
aW9uIGR1cmluZyBNTSBjYWxsYmFjawo+IEBAIC0xNTc4LDcgKzE1NzksOCBAQCBzdGF0aWMgaW50
IGFtZGdwdV92bV91cGRhdGVfcHRlcyhzdHJ1Y3QgYW1kZ3B1X3ZtX3VwZGF0ZV9wYXJhbXMgKnBh
cmFtcywKPiAgICogQHN0YXJ0OiBzdGFydCBvZiBtYXBwZWQgcmFuZ2UKPiAgICogQGxhc3Q6IGxh
c3QgbWFwcGVkIGVudHJ5Cj4gICAqIEBmbGFnczogZmxhZ3MgZm9yIHRoZSBlbnRyaWVzCj4gLSAq
IEBhZGRyOiBhZGRyIHRvIHNldCB0aGUgYXJlYSB0bwo+ICsgKiBAb2Zmc2V0OiBvZmZzZXQgaW50
byBub2RlcyBhbmQgcGFnZXNfYWRkcgo+ICsgKiBAbm9kZXM6IGFycmF5IG9mIGRybV9tbV9ub2Rl
cyB3aXRoIHRoZSBNQyBhZGRyZXNzZXMKPiAgICogQHBhZ2VzX2FkZHI6IERNQSBhZGRyZXNzZXMg
dG8gdXNlIGZvciBtYXBwaW5nCj4gICAqIEBmZW5jZTogb3B0aW9uYWwgcmVzdWx0aW5nIGZlbmNl
Cj4gICAqCj4gQEAgLTE1ODgsMTUgKzE1OTAsMTggQEAgc3RhdGljIGludCBhbWRncHVfdm1fdXBk
YXRlX3B0ZXMoc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zICpwYXJhbXMsCj4gICAqIDAg
Zm9yIHN1Y2Nlc3MsIC1FSU5WQUwgZm9yIGZhaWx1cmUuCj4gICAqLwo+ICBzdGF0aWMgaW50IGFt
ZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPiAr
CQkJCSAgICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYm9fYWRldiwKPiAgCQkJCSAgICAgICBz
dHJ1Y3QgYW1kZ3B1X3ZtICp2bSwgYm9vbCBpbW1lZGlhdGUsCj4gIAkJCQkgICAgICAgYm9vbCB1
bmxvY2tlZCwgc3RydWN0IGRtYV9yZXN2ICpyZXN2LAo+ICAJCQkJICAgICAgIHVpbnQ2NF90IHN0
YXJ0LCB1aW50NjRfdCBsYXN0LAo+IC0JCQkJICAgICAgIHVpbnQ2NF90IGZsYWdzLCB1aW50NjRf
dCBhZGRyLAo+ICsJCQkJICAgICAgIHVpbnQ2NF90IGZsYWdzLCB1aW50NjRfdCBvZmZzZXQsCj4g
KwkJCQkgICAgICAgc3RydWN0IGRybV9tbV9ub2RlICpub2RlcywKPiAgCQkJCSAgICAgICBkbWFf
YWRkcl90ICpwYWdlc19hZGRyLAo+ICAJCQkJICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipmZW5j
ZSkKPiAgewo+ICAJc3RydWN0IGFtZGdwdV92bV91cGRhdGVfcGFyYW1zIHBhcmFtczsKPiAgCWVu
dW0gYW1kZ3B1X3N5bmNfbW9kZSBzeW5jX21vZGU7Cj4gKwl1aW50NjRfdCBwZm47Cj4gIAlpbnQg
cjsKPiAgCj4gIAltZW1zZXQoJnBhcmFtcywgMCwgc2l6ZW9mKHBhcmFtcykpOwo+IEBAIC0xNjE0
LDYgKzE2MTksMTQgQEAgc3RhdGljIGludCBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4gIAllbHNlCj4gIAkJc3luY19tb2RlID0gQU1ER1BV
X1NZTkNfRVhQTElDSVQ7Cj4gIAo+ICsJcGZuID0gb2Zmc2V0ID4+IFBBR0VfU0hJRlQ7Cj4gKwlp
ZiAobm9kZXMpIHsKPiArCQl3aGlsZSAocGZuID49IG5vZGVzLT5zaXplKSB7Cj4gKwkJCXBmbiAt
PSBub2Rlcy0+c2l6ZTsKPiArCQkJKytub2RlczsKPiArCQl9Cj4gKwl9Cj4gKwo+ICAJYW1kZ3B1
X3ZtX2V2aWN0aW9uX2xvY2sodm0pOwo+ICAJaWYgKHZtLT5ldmljdGluZykgewo+ICAJCXIgPSAt
RUJVU1k7Cj4gQEAgLTE2MzIsMTA1ICsxNjQ1LDQ3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2Jv
X3VwZGF0ZV9tYXBwaW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAJaWYgKHIpCj4g
IAkJZ290byBlcnJvcl91bmxvY2s7Cj4gIAo+IC0JciA9IGFtZGdwdV92bV91cGRhdGVfcHRlcygm
cGFyYW1zLCBzdGFydCwgbGFzdCArIDEsIGFkZHIsIGZsYWdzKTsKPiAtCWlmIChyKQo+IC0JCWdv
dG8gZXJyb3JfdW5sb2NrOwo+IC0KPiAtCXIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBh
cmFtcywgZmVuY2UpOwo+IC0KPiAtZXJyb3JfdW5sb2NrOgo+IC0JYW1kZ3B1X3ZtX2V2aWN0aW9u
X3VubG9jayh2bSk7Cj4gLQlyZXR1cm4gcjsKPiAtfQo+IC0KPiAtLyoqCj4gLSAqIGFtZGdwdV92
bV9ib19zcGxpdF9tYXBwaW5nIC0gc3BsaXQgYSBtYXBwaW5nIGludG8gc21hbGxlciBjaHVua3MK
PiAtICoKPiAtICogQGFkZXY6IGFtZGdwdV9kZXZpY2UgcG9pbnRlcgo+IC0gKiBAcmVzdjogZmVu
Y2VzIHdlIG5lZWQgdG8gc3luYyB0bwo+IC0gKiBAcGFnZXNfYWRkcjogRE1BIGFkZHJlc3NlcyB0
byB1c2UgZm9yIG1hcHBpbmcKPiAtICogQHZtOiByZXF1ZXN0ZWQgdm0KPiAtICogQG1hcHBpbmc6
IG1hcHBlZCByYW5nZSBhbmQgZmxhZ3MgdG8gdXNlIGZvciB0aGUgdXBkYXRlCj4gLSAqIEBmbGFn
czogSFcgZmxhZ3MgZm9yIHRoZSBtYXBwaW5nCj4gLSAqIEBib19hZGV2OiBhbWRncHVfZGV2aWNl
IHBvaW50ZXIgdGhhdCBibyBhY3R1YWxseSBiZWVuIGFsbG9jYXRlZAo+IC0gKiBAbm9kZXM6IGFy
cmF5IG9mIGRybV9tbV9ub2RlcyB3aXRoIHRoZSBNQyBhZGRyZXNzZXMKPiAtICogQGZlbmNlOiBv
cHRpb25hbCByZXN1bHRpbmcgZmVuY2UKPiAtICoKPiAtICogU3BsaXQgdGhlIG1hcHBpbmcgaW50
byBzbWFsbGVyIGNodW5rcyBzbyB0aGF0IGVhY2ggdXBkYXRlIGZpdHMKPiAtICogaW50byBhIFNE
TUEgSUIuCj4gLSAqCj4gLSAqIFJldHVybnM6Cj4gLSAqIDAgZm9yIHN1Y2Nlc3MsIC1FSU5WQUwg
Zm9yIGZhaWx1cmUuCj4gLSAqLwo+IC1zdGF0aWMgaW50IGFtZGdwdV92bV9ib19zcGxpdF9tYXBw
aW5nKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+IC0JCQkJICAgICAgc3RydWN0IGRtYV9y
ZXN2ICpyZXN2LAo+IC0JCQkJICAgICAgZG1hX2FkZHJfdCAqcGFnZXNfYWRkciwKPiAtCQkJCSAg
ICAgIHN0cnVjdCBhbWRncHVfdm0gKnZtLAo+IC0JCQkJICAgICAgc3RydWN0IGFtZGdwdV9ib192
YV9tYXBwaW5nICptYXBwaW5nLAo+IC0JCQkJICAgICAgdWludDY0X3QgZmxhZ3MsCj4gLQkJCQkg
ICAgICBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYm9fYWRldiwKPiAtCQkJCSAgICAgIHN0cnVjdCBk
cm1fbW1fbm9kZSAqbm9kZXMsCj4gLQkJCQkgICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2Up
Cj4gLXsKPiAtCXVuc2lnbmVkIG1pbl9saW5lYXJfcGFnZXMgPSAxIDw8IGFkZXYtPnZtX21hbmFn
ZXIuZnJhZ21lbnRfc2l6ZTsKPiAtCXVpbnQ2NF90IHBmbiwgc3RhcnQgPSBtYXBwaW5nLT5zdGFy
dDsKPiAtCWludCByOwo+IC0KPiAtCS8qIG5vcm1hbGx5LGJvX3ZhLT5mbGFncyBvbmx5IGNvbnRp
YW5zIFJFQURBQkxFIGFuZCBXSVJURUFCTEUgYml0IGdvIGhlcmUKPiAtCSAqIGJ1dCBpbiBjYXNl
IG9mIHNvbWV0aGluZywgd2UgZmlsdGVyIHRoZSBmbGFncyBpbiBmaXJzdCBwbGFjZQo+IC0JICov
Cj4gLQlpZiAoIShtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfUkVBREFCTEUpKQo+IC0JCWZs
YWdzICY9IH5BTURHUFVfUFRFX1JFQURBQkxFOwo+IC0JaWYgKCEobWFwcGluZy0+ZmxhZ3MgJiBB
TURHUFVfUFRFX1dSSVRFQUJMRSkpCj4gLQkJZmxhZ3MgJj0gfkFNREdQVV9QVEVfV1JJVEVBQkxF
Owo+IC0KPiAtCS8qIEFwcGx5IEFTSUMgc3BlY2lmaWMgbWFwcGluZyBmbGFncyAqLwo+IC0JYW1k
Z3B1X2dtY19nZXRfdm1fcHRlKGFkZXYsIG1hcHBpbmcsICZmbGFncyk7Cj4gLQo+IC0JdHJhY2Vf
YW1kZ3B1X3ZtX2JvX3VwZGF0ZShtYXBwaW5nKTsKPiAtCj4gLQlwZm4gPSBtYXBwaW5nLT5vZmZz
ZXQgPj4gUEFHRV9TSElGVDsKPiAtCWlmIChub2Rlcykgewo+IC0JCXdoaWxlIChwZm4gPj0gbm9k
ZXMtPnNpemUpIHsKPiAtCQkJcGZuIC09IG5vZGVzLT5zaXplOwo+IC0JCQkrK25vZGVzOwo+IC0J
CX0KPiAtCX0KPiAtCj4gIAlkbyB7Cj4gLQkJZG1hX2FkZHJfdCAqZG1hX2FkZHIgPSBOVUxMOwo+
IC0JCXVpbnQ2NF90IG1heF9lbnRyaWVzOwo+IC0JCXVpbnQ2NF90IGFkZHIsIGxhc3Q7Cj4gKwkJ
dWludDY0X3QgdG1wLCBudW1fZW50cmllcywgYWRkcjsKPiAgCj4gLQkJbWF4X2VudHJpZXMgPSBt
YXBwaW5nLT5sYXN0IC0gc3RhcnQgKyAxOwo+ICsKPiArCQludW1fZW50cmllcyA9IGxhc3QgLSBz
dGFydCArIDE7Cj4gIAkJaWYgKG5vZGVzKSB7Cj4gIAkJCWFkZHIgPSBub2Rlcy0+c3RhcnQgPDwg
UEFHRV9TSElGVDsKPiAtCQkJbWF4X2VudHJpZXMgPSBtaW4oKG5vZGVzLT5zaXplIC0gcGZuKSAq
Cj4gLQkJCQlBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFLCBtYXhfZW50cmllcyk7Cj4gKwkJ
CW51bV9lbnRyaWVzID0gbWluKChub2Rlcy0+c2l6ZSAtIHBmbikgKgo+ICsJCQkJQU1ER1BVX0dQ
VV9QQUdFU19JTl9DUFVfUEFHRSwgbnVtX2VudHJpZXMpOwo+ICAJCX0gZWxzZSB7Cj4gIAkJCWFk
ZHIgPSAwOwo+ICAJCX0KPiAgCj4gIAkJaWYgKHBhZ2VzX2FkZHIpIHsKPiAtCQkJdWludDY0X3Qg
Y291bnQ7Cj4gKwkJCWJvb2wgY29udGlndW91cyA9IHRydWU7Cj4gIAo+IC0JCQlmb3IgKGNvdW50
ID0gMTsKPiAtCQkJICAgICBjb3VudCA8IG1heF9lbnRyaWVzIC8gQU1ER1BVX0dQVV9QQUdFU19J
Tl9DUFVfUEFHRTsKPiAtCQkJICAgICArK2NvdW50KSB7Cj4gLQkJCQl1aW50NjRfdCBpZHggPSBw
Zm4gKyBjb3VudDsKPiArCQkJaWYgKG51bV9lbnRyaWVzID4gQU1ER1BVX0dQVV9QQUdFU19JTl9D
UFVfUEFHRSkgewo+ICsJCQkJdWludDY0X3QgY291bnQ7Cj4gIAo+IC0JCQkJaWYgKHBhZ2VzX2Fk
ZHJbaWR4XSAhPQo+IC0JCQkJICAgIChwYWdlc19hZGRyW2lkeCAtIDFdICsgUEFHRV9TSVpFKSkK
PiAtCQkJCQlicmVhazsKPiArCQkJCWNvbnRpZ3VvdXMgPSBwYWdlc19hZGRyW3BmbiArIDFdID09
Cj4gKwkJCQkJcGFnZXNfYWRkcltwZm5dICsgUEFHRV9TSVpFOwo+ICsKPiArCQkJCXRtcCA9IG51
bV9lbnRyaWVzIC8KPiArCQkJCQlBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFOwo+ICsJCQkJ
Zm9yIChjb3VudCA9IDI7IGNvdW50IDwgdG1wOyArK2NvdW50KSB7Cj4gKwkJCQkJdWludDY0X3Qg
aWR4ID0gcGZuICsgY291bnQ7Cj4gKwo+ICsJCQkJCWlmIChjb250aWd1b3VzICE9IChwYWdlc19h
ZGRyW2lkeF0gPT0KPiArCQkJCQkgICAgcGFnZXNfYWRkcltpZHggLSAxXSArIFBBR0VfU0laRSkp
Cj4gKwkJCQkJCWJyZWFrOwo+ICsJCQkJfQo+ICsJCQkJbnVtX2VudHJpZXMgPSBjb3VudCAqCj4g
KwkJCQkJQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRTsKPiAgCQkJfQo+ICAKPiAtCQkJaWYg
KGNvdW50IDwgbWluX2xpbmVhcl9wYWdlcykgewo+ICsJCQlpZiAoIWNvbnRpZ3VvdXMpIHsKPiAg
CQkJCWFkZHIgPSBwZm4gPDwgUEFHRV9TSElGVDsKPiAtCQkJCWRtYV9hZGRyID0gcGFnZXNfYWRk
cjsKPiArCQkJCXBhcmFtcy5wYWdlc19hZGRyID0gcGFnZXNfYWRkcjsKPiAgCQkJfSBlbHNlIHsK
PiAgCQkJCWFkZHIgPSBwYWdlc19hZGRyW3Bmbl07Cj4gLQkJCQltYXhfZW50cmllcyA9IGNvdW50
ICoKPiAtCQkJCQlBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFOwo+ICsJCQkJcGFyYW1zLnBh
Z2VzX2FkZHIgPSBOVUxMOwo+ICAJCQl9Cj4gIAo+ICAJCX0gZWxzZSBpZiAoZmxhZ3MgJiAoQU1E
R1BVX1BURV9WQUxJRCB8IEFNREdQVV9QVEVfUFJUKSkgewo+IEBAIC0xNzM4LDIzICsxNjkzLDI1
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3ZtX2JvX3NwbGl0X21hcHBpbmcoc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsCj4gIAkJCWFkZHIgKz0gcGZuIDw8IFBBR0VfU0hJRlQ7Cj4gIAkJfQo+ICAK
PiAtCQlsYXN0ID0gc3RhcnQgKyBtYXhfZW50cmllcyAtIDE7Cj4gLQkJciA9IGFtZGdwdV92bV9i
b191cGRhdGVfbWFwcGluZyhhZGV2LCB2bSwgZmFsc2UsIGZhbHNlLCByZXN2LAo+IC0JCQkJCQlz
dGFydCwgbGFzdCwgZmxhZ3MsIGFkZHIsCj4gLQkJCQkJCWRtYV9hZGRyLCBmZW5jZSk7Cj4gKwkJ
dG1wID0gc3RhcnQgKyBudW1fZW50cmllczsKPiArCQlyID0gYW1kZ3B1X3ZtX3VwZGF0ZV9wdGVz
KCZwYXJhbXMsIHN0YXJ0LCB0bXAsIGFkZHIsIGZsYWdzKTsKPiAgCQlpZiAocikKPiAtCQkJcmV0
dXJuIHI7Cj4gKwkJCWdvdG8gZXJyb3JfdW5sb2NrOwo+ICAKPiAtCQlwZm4gKz0gKGxhc3QgLSBz
dGFydCArIDEpIC8gQU1ER1BVX0dQVV9QQUdFU19JTl9DUFVfUEFHRTsKPiArCQlwZm4gKz0gbnVt
X2VudHJpZXMgLyBBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFOwo+ICAJCWlmIChub2RlcyAm
JiBub2Rlcy0+c2l6ZSA9PSBwZm4pIHsKPiAgCQkJcGZuID0gMDsKPiAgCQkJKytub2RlczsKPiAg
CQl9Cj4gLQkJc3RhcnQgPSBsYXN0ICsgMTsKPiArCQlzdGFydCA9IHRtcDsKPiAgCj4gLQl9IHdo
aWxlICh1bmxpa2VseShzdGFydCAhPSBtYXBwaW5nLT5sYXN0ICsgMSkpOwo+ICsJfSB3aGlsZSAo
dW5saWtlbHkoc3RhcnQgIT0gbGFzdCArIDEpKTsKPiAgCj4gLQlyZXR1cm4gMDsKPiArCXIgPSB2
bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywgZmVuY2UpOwo+ICsKPiArZXJyb3JfdW5s
b2NrOgo+ICsJYW1kZ3B1X3ZtX2V2aWN0aW9uX3VubG9jayh2bSk7Cj4gKwlyZXR1cm4gcjsKPiAg
fQo+ICAKPiAgLyoqCj4gQEAgLTE4MzUsOSArMTc5MiwyNiBAQCBpbnQgYW1kZ3B1X3ZtX2JvX3Vw
ZGF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgc3RydWN0IGFtZGdwdV9ib192YSAqYm9f
dmEsCj4gIAl9Cj4gIAo+ICAJbGlzdF9mb3JfZWFjaF9lbnRyeShtYXBwaW5nLCAmYm9fdmEtPmlu
dmFsaWRzLCBsaXN0KSB7Cj4gLQkJciA9IGFtZGdwdV92bV9ib19zcGxpdF9tYXBwaW5nKGFkZXYs
IHJlc3YsIHBhZ2VzX2FkZHIsIHZtLAo+IC0JCQkJCSAgICAgICBtYXBwaW5nLCBmbGFncywgYm9f
YWRldiwgbm9kZXMsCj4gLQkJCQkJICAgICAgIGxhc3RfdXBkYXRlKTsKPiArCQl1aW50NjRfdCB1
cGRhdGVfZmxhZ3MgPSBmbGFnczsKPiArCj4gKwkJLyogbm9ybWFsbHksYm9fdmEtPmZsYWdzIG9u
bHkgY29udGlhbnMgUkVBREFCTEUgYW5kIFdJUlRFQUJMRSBiaXQgZ28gaGVyZQo+ICsJCSAqIGJ1
dCBpbiBjYXNlIG9mIHNvbWV0aGluZywgd2UgZmlsdGVyIHRoZSBmbGFncyBpbiBmaXJzdCBwbGFj
ZQo+ICsJCSAqLwo+ICsJCWlmICghKG1hcHBpbmctPmZsYWdzICYgQU1ER1BVX1BURV9SRUFEQUJM
RSkpCj4gKwkJCXVwZGF0ZV9mbGFncyAmPSB+QU1ER1BVX1BURV9SRUFEQUJMRTsKPiArCQlpZiAo
IShtYXBwaW5nLT5mbGFncyAmIEFNREdQVV9QVEVfV1JJVEVBQkxFKSkKPiArCQkJdXBkYXRlX2Zs
YWdzICY9IH5BTURHUFVfUFRFX1dSSVRFQUJMRTsKPiArCj4gKwkJLyogQXBwbHkgQVNJQyBzcGVj
aWZpYyBtYXBwaW5nIGZsYWdzICovCj4gKwkJYW1kZ3B1X2dtY19nZXRfdm1fcHRlKGFkZXYsIG1h
cHBpbmcsICZ1cGRhdGVfZmxhZ3MpOwo+ICsKPiArCQl0cmFjZV9hbWRncHVfdm1fYm9fdXBkYXRl
KG1hcHBpbmcpOwo+ICsKPiArCQlyID0gYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYs
IGJvX2FkZXYsIHZtLCBmYWxzZSwgZmFsc2UsCj4gKwkJCQkJCXJlc3YsIG1hcHBpbmctPnN0YXJ0
LAo+ICsJCQkJCQltYXBwaW5nLT5sYXN0LCB1cGRhdGVfZmxhZ3MsCj4gKwkJCQkJCW1hcHBpbmct
Pm9mZnNldCwgbm9kZXMsCj4gKwkJCQkJCXBhZ2VzX2FkZHIsIGxhc3RfdXBkYXRlKTsKPiAgCQlp
ZiAocikKPiAgCQkJcmV0dXJuIHI7Cj4gIAl9Cj4gQEAgLTIwNDUsOSArMjAxOSwxMCBAQCBpbnQg
YW1kZ3B1X3ZtX2NsZWFyX2ZyZWVkKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAo+ICAJCSAg
ICBtYXBwaW5nLT5zdGFydCA8IEFNREdQVV9HTUNfSE9MRV9TVEFSVCkKPiAgCQkJaW5pdF9wdGVf
dmFsdWUgPSBBTURHUFVfUFRFX0RFRkFVTFRfQVRDOwo+ICAKPiAtCQlyID0gYW1kZ3B1X3ZtX2Jv
X3VwZGF0ZV9tYXBwaW5nKGFkZXYsIHZtLCBmYWxzZSwgZmFsc2UsIHJlc3YsCj4gLQkJCQkJCW1h
cHBpbmctPnN0YXJ0LCBtYXBwaW5nLT5sYXN0LAo+IC0JCQkJCQlpbml0X3B0ZV92YWx1ZSwgMCwg
TlVMTCwgJmYpOwo+ICsJCXIgPSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgYWRl
diwgdm0sIGZhbHNlLCBmYWxzZSwKPiArCQkJCQkJcmVzdiwgbWFwcGluZy0+c3RhcnQsCj4gKwkJ
CQkJCW1hcHBpbmctPmxhc3QsIGluaXRfcHRlX3ZhbHVlLAo+ICsJCQkJCQkwLCBOVUxMLCBOVUxM
LCAmZik7Cj4gIAkJYW1kZ3B1X3ZtX2ZyZWVfbWFwcGluZyhhZGV2LCB2bSwgbWFwcGluZywgZik7
Cj4gIAkJaWYgKHIpIHsKPiAgCQkJZG1hX2ZlbmNlX3B1dChmKTsKPiBAQCAtMzM3NSw4ICszMzUw
LDkgQEAgYm9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2LCB1bnNpZ25lZCBpbnQgcGFzaWQsCj4gIAkJdmFsdWUgPSAwOwo+ICAJfQo+ICAKPiAtCXIg
PSBhbWRncHVfdm1fYm9fdXBkYXRlX21hcHBpbmcoYWRldiwgdm0sIHRydWUsIGZhbHNlLCBOVUxM
LCBhZGRyLAo+IC0JCQkJCWFkZHIgKyAxLCBmbGFncywgdmFsdWUsIE5VTEwsIE5VTEwpOwo+ICsJ
ciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGluZyhhZGV2LCBhZGV2LCB2bSwgdHJ1ZSwgZmFs
c2UsIE5VTEwsIGFkZHIsCj4gKwkJCQkJYWRkciArIDEsIGZsYWdzLCB2YWx1ZSwgTlVMTCwgTlVM
TCwKPiArCQkJCQlOVUxMKTsKPiAgCWlmIChyKQo+ICAJCWdvdG8gZXJyb3JfdW5sb2NrOwo+ICAK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1kLWdmeCBt
YWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
