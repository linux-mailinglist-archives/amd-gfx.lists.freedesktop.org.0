Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C424CAE9
	for <lists+amd-gfx@lfdr.de>; Fri, 21 Aug 2020 04:41:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E936EA87;
	Fri, 21 Aug 2020 02:41:22 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C376EA87
 for <amd-gfx@lists.freedesktop.org>; Fri, 21 Aug 2020 02:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V8oA+vgcopRQ4Q9lsRxpmd6G+/s0HdoOjKNw706HrIBkNi5EzSgreH6ZuT3D6pj6TRy3zAXF0clg+cHB50y1p8JXiqwqmSpTIW2uKAII+WCs6BM+qnaqDONL09hn2yuVapqNHFunnRll800GsHWaMY1r975+tHa2dJ2EmlO5EyDe+sCnlYe7/X4n+UZE2LN62ubJHydCLKH8s4dP4P124Sr2NDrxO32IZHal4z9IGFRaHXadHk5FA/m1w/m9npVBDZTpKdE/bE1NAybnN6cO2dAna2zuhSydjzfRqIfbiIha1LuJydPV4OOL4Ze9WCZAgV3rzLZmqv6YfDoCDONsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LI8X1dJUltIYzzd1ZN5fhVBTKlSHW21e5ct4oAosVY=;
 b=fUDPAc72FrMjQ1riJnQ+WOmGqeD+JkYeNsnGcEc/iMCGHzXOXncbThc/KxOZRwbuzOB/VYw6KQf9JtBsvM7dr8eFKxZZ4tEV7Ja/kL/YUMBFoikh+gGyZCaOxE0F75A2Qxopmm/IS3+HcXaIwePw5+LhdDGeCgIn0JoIGjo349I9NwI2xLWB6hdQAWYSE76DEyPX8O0ukLZZKUty50O5weMQqvlxPK8fueMqaJvTqGahjvig5TcrLi5YKk7AKAQR3h+PnSbVqq7m9WhmxAgQ3yCNEEnJ98F1l/27wJ49OYSPWIGZJ6RGE66ehtocY6A1HT2axZuwHdyMYuc6sx0C4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LI8X1dJUltIYzzd1ZN5fhVBTKlSHW21e5ct4oAosVY=;
 b=1HfEIzZBadsDKBGtb0hFt+Amcttm6ZCZI7aoaCx9uCU0FoDskI60NVycg055cjhsdptMw7sBaQxZFOtVkv+lH4iYRajTdRbXWITvUq8UDAHmJLZHCw7ZhvrUpbg9egDg5d82U7h4+58fPsjH6ktEJYGqFNmnSe9BXex7Fx2X6vU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4573.namprd12.prod.outlook.com (2603:10b6:806:9c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Fri, 21 Aug
 2020 02:41:19 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::d548:1236:cb4f:1be9%7]) with mapi id 15.20.3305.025; Fri, 21 Aug 2020
 02:41:19 +0000
Subject: Re: [PATCH v4 2/2] drm/amdkfd: force raven as "dgpu" path (v4)
To: Huang Rui <ray.huang@amd.com>, amd-gfx@lists.freedesktop.org
References: <20200820084008.293114-1-ray.huang@amd.com>
 <20200820084008.293114-2-ray.huang@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f266f414-94a2-795f-bcd4-2076eba38043@amd.com>
Date: Thu, 20 Aug 2020 22:41:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200820084008.293114-2-ray.huang@amd.com>
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Fri, 21 Aug 2020 02:41:18 +0000
X-Originating-IP: [142.116.113.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 3f9c493b-fe24-4451-3738-08d8457baebb
X-MS-TrafficTypeDiagnostic: SA0PR12MB4573:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4573BC36DBD4AF4866CD0967925B0@SA0PR12MB4573.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjUqQ19wJjJMKQhq6o+oS2lyh6rzkyMVQ0WTCRIIyAWvIDgWWz1qSgXT5OydHUbbFvArAMwQHh9ApU8/Fo+GUwbrNJyvcjwRgPN7xIrn0xgWctNH6ThjqC1mZTnnDlF1ZSLrqYt5mlWpkD6aO4OILjkhVl4RpyQPo26T1cvc6rIgcV8AvcUF6RaiHSsW2U1F6yzqMW9rU5rxWc/3A3HqVhOHIY7Sld0Xk7LJPH1hFl887K5cYXfc92oze2vKVqU6vqmVlFL2qIh5aKBhAG3TsQimwQTu+XXC5FHiu/a/buazBhcqKkzLhKI1cvSHyR9N+Wp5l0GSLPhTX0TPsskO7hkvoVQFHvsuIuz7z1ndA2OMJbPcfopjP0MVuXqDQHZzzBFWG6VwLroHFndeDlDVHLkgj5fbyDWIKzXI80ShVp8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(44832011)(66556008)(31696002)(110011004)(2616005)(478600001)(66946007)(956004)(66476007)(6486002)(83380400001)(31686004)(8936002)(8676002)(5660300002)(186003)(26005)(52116002)(2906002)(16576012)(36756003)(316002)(86362001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: C/Hh2l3ZNf6qpxXah7jnSqkbQW7wcLvtTYuliU1JATwwS0ZGxpHBAys4sx4bIT0ek9n9je38eDfb9dfl/ze4/kyaOX8WsoyREAp3ybLXNEA1/2UE+o925+Cf88DcSNLHL5rL1WsgC5oyZm2CnUknLiWTyn4Z+DmoZLSTbPIyQ1v/PjXcPH3PrnqobZ6bmPN3b87mY5eQWbUlgKYHnPw5yMzDVZXw4BdUUs8nUVh22y9hHvhCepPxOP9VugpJhwtta/7tfQcZOgeuRLvi494zgfHKG2I6JG5Km6qGxcXbld2xAptzF4PvGyWmuE60r9f21WYJ51nXMhtXGV9USSTYfJbmikL5b4LdbSQTP3qxAH50fctUFZw9lAlq++mHDHhIIHVI14hUmnBsRreizCXE2IKk+xUkSOEGuF2mL5ANMg2Rqx269PdOVppMNwpqB+gROMU2DSEMeY8sowYaAplULYhKg1JkArRJq24R2ZWr0zbFLdfw4783dG10atdodzAt3tUWay0NcNJxmLMJgn4Skh/f+Ll1+Eo5n37g+daAh3FahOEH8ljdr8oldPAjrSc/fslvDDgcHlThyQa462A7ZsYO/WTtcr/JM3SzL4l+wR+sCX/XZm/iJI9E0oqIQoahCy4BX+6xvZTKXWpTe6cVyA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f9c493b-fe24-4451-3738-08d8457baebb
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2020 02:41:18.9433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZeYEJkZx4JoMp/991PMCpLrGh8GhnK0fuiBuyue5kCSuDzv+bWM0e2dqRPvQLXLJbTia5+WMbFKzFqKzUrNA7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4573
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

CkFtIDIwMjAtMDgtMjAgdW0gNDo0MCBhLm0uIHNjaHJpZWIgSHVhbmcgUnVpOgo+IFdlIHN0aWxs
IGhhdmUgYSBmZXcgaW9tbXUgaXNzdWVzIHdoaWNoIG5lZWQgdG8gYWRkcmVzcywgc28gZm9yY2Ug
cmF2ZW4KPiBhcyAiZGdwdSIgcGF0aCBmb3IgdGhlIG1vbWVudC4KPgo+IFRoaXMgaXMgdG8gYWRk
IHRoZSBmYWxsYmFjayBwYXRoIHRvIGJ5cGFzcyBJT01NVSBpZiBJT01NVSB2MiBpcyBkaXNhYmxl
ZAo+IG9yIEFDUEkgQ1JBVCB0YWJsZSBub3QgY29ycmVjdC4KPgo+IHYyOiBVc2UgaWdub3JlX2Ny
YXQgcGFyYW1ldGVyIHRvIGRlY2lkZSB3aGV0aGVyIGl0IHdpbGwgZ28gd2l0aCBJT01NVXYyLgo+
IHYzOiBBbGlnbiB3aXRoIGV4aXN0ZWQgdGh1bmssIGRvbid0IGNoYW5nZSB0aGUgd2F5IG9mIHJh
dmVuLCBvbmx5IHJlbm9pcgo+ICAgICB3aWxsIHVzZSAiZGdwdSIgcGF0aCBieSBkZWZhdWx0Lgo+
IHY0OiBkb24ndCB1cGRhdGUgZ2xvYmFsIGlnbm9yZV9jcmF0IGluIHRoZSBkcml2ZXIsIGFuZCBy
ZXZpc2UgZmFsbGJhY2sKPiAgICAgZnVuY3Rpb24gaWYgQ1JBVCBpcyBicm9rZW4uCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZHJ2LmMgICB8ICA1ICsrKystCj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgICAgIHwgMjMgKysrKysrKysrKysrKysrKysr
KysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jICAgfCAgNSAr
KysrLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oICAgICB8IDEwICsr
KysrKysrLS0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgfCAy
MCArKysrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNoYW5nZWQsIDU3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Ry
di5jCj4gaW5kZXggYTlhNDMxOWMyNGFlLi4xODlmOWQ3ZTE5MGQgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jCj4gQEAgLTY4NCwxMSArNjg0LDE0IEBAIE1PRFVM
RV9QQVJNX0RFU0MoZGVidWdfbGFyZ2ViYXIsCj4gICAqIElnbm9yZSBDUkFUIHRhYmxlIGR1cmlu
ZyBLRkQgaW5pdGlhbGl6YXRpb24uIEJ5IGRlZmF1bHQsIEtGRCB1c2VzIHRoZSBBQ1BJIENSQVQK
PiAgICogdGFibGUgdG8gZ2V0IGluZm9ybWF0aW9uIGFib3V0IEFNRCBBUFVzLiBUaGlzIG9wdGlv
biBjYW4gc2VydmUgYXMgYSB3b3JrYXJvdW5kIG9uCj4gICAqIHN5c3RlbXMgd2l0aCBhIGJyb2tl
biBDUkFUIHRhYmxlLgo+ICsgKgo+ICsgKiBEZWZhdWx0IGlzIGF1dG8gKGFjY29yZGluZyB0byBh
c2ljIHR5cGUsIGlvbW11X3YyLCBhbmQgY3JhdCB0YWJsZSwgdG8gZGVjaWRlCj4gKyAqIHdoZWh0
ZXIgdXNlIENSQVQpCj4gICAqLwo+ICBpbnQgaWdub3JlX2NyYXQ7Cj4gIG1vZHVsZV9wYXJhbShp
Z25vcmVfY3JhdCwgaW50LCAwNDQ0KTsKPiAgTU9EVUxFX1BBUk1fREVTQyhpZ25vcmVfY3JhdCwK
PiAtCSJJZ25vcmUgQ1JBVCB0YWJsZSBkdXJpbmcgS0ZEIGluaXRpYWxpemF0aW9uICgwID0gdXNl
IENSQVQgKGRlZmF1bHQpLCAxID0gaWdub3JlIENSQVQpIik7Cj4gKwkiSWdub3JlIENSQVQgdGFi
bGUgZHVyaW5nIEtGRCBpbml0aWFsaXphdGlvbiAoMCA9IGF1dG8gKGRlZmF1bHQpLCAxID0gaWdu
b3JlIENSQVQpIik7Cj4gIAo+ICAvKioKPiAgICogRE9DOiBoYWx0X2lmX2h3c19oYW5nIChpbnQp
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfY3JhdC5jCj4gaW5kZXggNTk1NTdlM2UyMDZh
Li5hMTdjZmMyOTAwNzIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQv
a2ZkX2NyYXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9jcmF0LmMK
PiBAQCAtMjIsNiArMjIsNyBAQAo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICAjaW5j
bHVkZSA8bGludXgvYWNwaS5oPgo+ICsjaW5jbHVkZSA8YXNtL3Byb2Nlc3Nvci5oPgo+ICAjaW5j
bHVkZSAia2ZkX2NyYXQuaCIKPiAgI2luY2x1ZGUgImtmZF9wcml2LmgiCj4gICNpbmNsdWRlICJr
ZmRfdG9wb2xvZ3kuaCIKPiBAQCAtNzQwLDYgKzc0MSwyNSBAQCBzdGF0aWMgaW50IGtmZF9maWxs
X2dwdV9jYWNoZV9pbmZvKHN0cnVjdCBrZmRfZGV2ICprZGV2LAo+ICAJcmV0dXJuIDA7Cj4gIH0K
PiAgCj4gKwo+ICsjaWZkZWYgQ09ORklHX0FDUEkKPiArCj4gK2Jvb2wga2ZkX2lnbm9yZV9jcmF0
KHZvaWQpCj4gK3sKPiArCWJvb2wgcmV0Owo+ICsKPiArCWlmIChpZ25vcmVfY3JhdCkKPiArCQly
ZXR1cm4gdHJ1ZTsKPiArCj4gKyNpZm5kZWYgS0ZEX1NVUFBPUlRfSU9NTVVfVjIKPiArCXJldCA9
IHRydWU7Cj4gKyNlbHNlCj4gKwlyZXQgPSBmYWxzZTsKPiArI2VuZGlmCj4gKwo+ICsJcmV0dXJu
IHJldDsKPiArfQo+ICsKPiAgLyoKPiAgICoga2ZkX2NyZWF0ZV9jcmF0X2ltYWdlX2FjcGkgLSBB
bGxvY2F0ZXMgbWVtb3J5IGZvciBDUkFUIGltYWdlIGFuZAo+ICAgKiBjb3BpZXMgQ1JBVCBmcm9t
IEFDUEkgKGlmIGF2YWlsYWJsZSkuCj4gQEAgLTc1MSw3ICs3NzEsNiBAQCBzdGF0aWMgaW50IGtm
ZF9maWxsX2dwdV9jYWNoZV9pbmZvKHN0cnVjdCBrZmRfZGV2ICprZGV2LAo+ICAgKgo+ICAgKglS
ZXR1cm4gMCBpZiBzdWNjZXNzZnVsIGVsc2UgcmV0dXJuIGVycm9yIGNvZGUKPiAgICovCj4gLSNp
ZmRlZiBDT05GSUdfQUNQSQo+ICBpbnQga2ZkX2NyZWF0ZV9jcmF0X2ltYWdlX2FjcGkodm9pZCAq
KmNyYXRfaW1hZ2UsIHNpemVfdCAqc2l6ZSkKPiAgewo+ICAJc3RydWN0IGFjcGlfdGFibGVfaGVh
ZGVyICpjcmF0X3RhYmxlOwo+IEBAIC03NzUsNyArNzk0LDcgQEAgaW50IGtmZF9jcmVhdGVfY3Jh
dF9pbWFnZV9hY3BpKHZvaWQgKipjcmF0X2ltYWdlLCBzaXplX3QgKnNpemUpCj4gIAkJcmV0dXJu
IC1FSU5WQUw7Cj4gIAl9Cj4gIAo+IC0JaWYgKGlnbm9yZV9jcmF0KSB7Cj4gKwlpZiAoa2ZkX2ln
bm9yZV9jcmF0KCkpIHsKPiAgCQlwcl9pbmZvKCJDUkFUIHRhYmxlIGRpc2FibGVkIGJ5IG1vZHVs
ZSBvcHRpb25cbiIpOwo+ICAJCXJldHVybiAtRU5PREFUQTsKPiAgCX0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gaW5kZXggMmMwMzBjMmI1YjhkLi5mZGY2NGQzNjFi
ZTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2RldmljZS5jCj4gQEAgLTEx
Miw2ICsxMTIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGtmZF9kZXZpY2VfaW5mbyBjYXJyaXpv
X2RldmljZV9pbmZvID0gewo+ICAJLm51bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsCj4gIAkubnVt
X3NkbWFfcXVldWVzX3Blcl9lbmdpbmUgPSAyLAo+ICB9Owo+ICsjZW5kaWYKPiAgCj4gIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIHJhdmVuX2RldmljZV9pbmZvID0gewo+ICAJ
LmFzaWNfZmFtaWx5ID0gQ0hJUF9SQVZFTiwKPiBAQCAtMTMwLDcgKzEzMSw2IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qga2ZkX2RldmljZV9pbmZvIHJhdmVuX2RldmljZV9pbmZvID0gewo+ICAJLm51
bV94Z21pX3NkbWFfZW5naW5lcyA9IDAsCj4gIAkubnVtX3NkbWFfcXVldWVzX3Blcl9lbmdpbmUg
PSAyLAo+ICB9Owo+IC0jZW5kaWYKPiAgCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qga2ZkX2Rldmlj
ZV9pbmZvIGhhd2FpaV9kZXZpY2VfaW5mbyA9IHsKPiAgCS5hc2ljX2ZhbWlseSA9IENISVBfSEFX
QUlJLAo+IEBAIC02ODgsNiArNjg4LDkgQEAgYm9vbCBrZ2Qya2ZkX2RldmljZV9pbml0KHN0cnVj
dCBrZmRfZGV2ICprZmQsCj4gIAkJZ290byBnd3NfZXJyb3I7Cj4gIAl9Cj4gIAo+ICsJLyogSWYg
Q1JBVCBpcyBicm9rZW4sIHdvbid0IHNldCBpb21tdSBlbmFibGVkICovCj4gKwlrZmRfZG91Ymxl
X2NvbmZpcm1faW9tbXVfc3VwcG9ydChrZmQpOwo+ICsKPiAgCWlmIChrZmRfaW9tbXVfZGV2aWNl
X2luaXQoa2ZkKSkgewo+ICAJCWRldl9lcnIoa2ZkX2RldmljZSwgIkVycm9yIGluaXRpYWxpemlu
ZyBpb21tdXYyXG4iKTsKPiAgCQlnb3RvIGRldmljZV9pb21tdV9lcnJvcjsKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1ka2ZkL2tmZF9wcml2LmgKPiBpbmRleCA4MmY5NTU3NTBlNzUuLjViNzBmYmU0Mjlm
MSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJpdi5oCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3ByaXYuaAo+IEBAIC0zMDgsMTIg
KzMwOCwxNCBAQCBzdHJ1Y3Qga2ZkX2RldiB7Cj4gIAo+ICAJLyogeEdNSSAqLwo+ICAJdWludDY0
X3QgaGl2ZV9pZDsKPiAtICAgIAo+ICAJLyogVVVJRCAqLwo+ICAJdWludDY0X3QgdW5pcXVlX2lk
Owo+ICAKPiAgCWJvb2wgcGNpX2F0b21pY19yZXF1ZXN0ZWQ7Cj4gIAo+ICsJLyogVXNlIElPTU1V
IHYyIGZsYWcgKi8KPiArCWJvb2wgdXNlX2lvbW11X3YyOwo+ICsKPiAgCS8qIFNSQU0gRUNDIGZs
YWcgKi8KPiAgCWF0b21pY190IHNyYW1fZWNjX2ZsYWc7Cj4gIAo+IEBAIC0xMDA5LDYgKzEwMTEs
NyBAQCBzdHJ1Y3Qga2ZkX2RldiAqa2ZkX2RldmljZV9ieV9wY2lfZGV2KGNvbnN0IHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KTsKPiAgc3RydWN0IGtmZF9kZXYgKmtmZF9kZXZpY2VfYnlfa2dkKGNvbnN0
IHN0cnVjdCBrZ2RfZGV2ICprZ2QpOwo+ICBpbnQga2ZkX3RvcG9sb2d5X2VudW1fa2ZkX2Rldmlj
ZXModWludDhfdCBpZHgsIHN0cnVjdCBrZmRfZGV2ICoqa2Rldik7Cj4gIGludCBrZmRfbnVtYV9u
b2RlX3RvX2FwaWNfaWQoaW50IG51bWFfbm9kZV9pZCk7Cj4gK3ZvaWQga2ZkX2RvdWJsZV9jb25m
aXJtX2lvbW11X3N1cHBvcnQoc3RydWN0IGtmZF9kZXYgKmdwdSk7Cj4gIAo+ICAvKiBJbnRlcnJ1
cHRzICovCj4gIGludCBrZmRfaW50ZXJydXB0X2luaXQoc3RydWN0IGtmZF9kZXYgKmRldik7Cj4g
QEAgLTEyMzIsOSArMTIzNSwxMiBAQCBzdGF0aWMgaW5saW5lIGludCBrZmRfZGV2Y2dyb3VwX2No
ZWNrX3Blcm1pc3Npb24oc3RydWN0IGtmZF9kZXYgKmtmZCkKPiAgI2VuZGlmCj4gIH0KPiAgCj4g
K2Jvb2wga2ZkX2lnbm9yZV9jcmF0KHZvaWQpOwo+ICsKPiAgc3RhdGljIGlubGluZSBib29sIGtm
ZF9kZXZpY2VfdXNlX2lvbW11X3YyKGNvbnN0IHN0cnVjdCBrZmRfZGV2ICpkZXYpCj4gIHsKPiAt
CXJldHVybiBkZXYgJiYgZGV2LT5kZXZpY2VfaW5mby0+bmVlZHNfaW9tbXVfZGV2aWNlOwo+ICsJ
cmV0dXJuICFrZmRfaWdub3JlX2NyYXQoKSAmJiBkZXYgJiYgZGV2LT51c2VfaW9tbXVfdjIgJiYK
PiArCQlkZXYtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZpY2U7CgpJIHRoaW5rIHRoaXMg
Y291bGQgbm93IGJlIHNpbXBsaWZpZWQ6CgogICAgcmV0dXJuIGRldiAmJiBkZXYtPnVzZV9pb21t
dV92MjsgCgpTbyBtYXliZSB5b3UgZG9uJ3QgbmVlZCB0aGlzIGZ1bmN0aW9uIGFueSBtb3JlLgoK
Cj4gIH0KPiAgCj4gIC8qIERlYnVnZnMgKi8KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9r
ZmRfdG9wb2xvZ3kuYwo+IGluZGV4IDRiMjk4MTVlOTIwNS4uODkwN2I1MzE3MTAzIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF90b3BvbG9neS5jCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX3RvcG9sb2d5LmMKPiBAQCAtMTU3OSw2ICsx
NTc5LDI2IEBAIGludCBrZmRfbnVtYV9ub2RlX3RvX2FwaWNfaWQoaW50IG51bWFfbm9kZV9pZCkK
PiAgCXJldHVybiBrZmRfY3B1bWFza190b19hcGljX2lkKGNwdW1hc2tfb2Zfbm9kZShudW1hX25v
ZGVfaWQpKTsKPiAgfQo+ICAKPiArdm9pZCBrZmRfZG91YmxlX2NvbmZpcm1faW9tbXVfc3VwcG9y
dChzdHJ1Y3Qga2ZkX2RldiAqZ3B1KQo+ICt7Cj4gKwlzdHJ1Y3Qga2ZkX3RvcG9sb2d5X2Rldmlj
ZSAqZGV2Owo+ICsKPiArCXVuc2lnbmVkIHRlbXAgPSAwOwo+ICsKPiArCWRvd25fcmVhZCgmdG9w
b2xvZ3lfbG9jayk7Cj4gKwo+ICsJLyogVGhlIGNwdV9jb3Jlc19jb3VudCBhbmQgc2ltZF9jb3Vu
dCBhcmVuJ3QgemVybyBhdCB0aGUgc2FtZSB0aW1lIGluCj4gKwkgKiBBUFUgbm9kZS4KPiArCSAq
Lwo+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeShkZXYsICZ0b3BvbG9neV9kZXZpY2VfbGlzdCwgbGlz
dCkKPiArCQl0ZW1wIHw9IGRldi0+bm9kZV9wcm9wcy5jcHVfY29yZXNfY291bnQgKgo+ICsJCQlk
ZXYtPm5vZGVfcHJvcHMuc2ltZF9jb3VudDsKCllvdSBzaG91bGRuJ3QgbG9vayBhdCBhbGwgR1BV
cywgb25seSBhdCB0aGUgR1BVIGN1cnJlbnRseSBiZWluZwppbml0aWFsaXplZC4gT3RoZXJ3aXNl
IGFsbCB5b3VyIGRHUFVzIGluIGFuIEFQVSBzeXN0ZW0gd2lsbCBhbHNvIGhhdmUKdXNlX2lvbW11
X3YyID09IHRydWUsIHdoaWNoIHdvdWxkIGJlIGNvbmZ1c2luZy4KCkknZCBkbyB0aGlzIGluIGtm
ZF9hc3NpZ25fZ3B1LCBiZWNhdXNlIGF0IHRoYXQgcG9pbnQgeW91IGhhdmUgYWNjZXNzIHRvCnRo
ZSBrZmRfdG9wb2xvZ3lfZGV2aWNlIGFuZCB0aGUga2ZkX2RldiBhdCB0aGUgc2FtZSB0aW1lIHdp
dGhvdXQgaGF2aW5nCnRvIGFkZCBhbm90aGVyIGxvb3AuCgogICAgICAgICAgICAuLi4KICAgIAls
aXN0X2Zvcl9lYWNoX2VudHJ5KGRldiwgJnRvcG9sb2d5X2RldmljZV9saXN0LCBsaXN0KSB7CiAg
ICAgICAgICAgICAgICAgICAgLyogRGlzY3JldGUgR1BVcyBuZWVkIHRoZWlyIG93biB0b3BvbG9n
eSBkZXZpY2UgbGlzdAogICAgICAgICAgICAgICAgICAgICAqIGVudHJpZXMuIERvbid0IGFzc2ln
biB0aGVtIHRvIENQVS9BUFUgbm9kZXMuCiAgICAgICAgICAgICAgICAgICAgICovCiAgICAgICAg
ICAgICAgICAgICAgaWYgKCFncHUtPmRldmljZV9pbmZvLT5uZWVkc19pb21tdV9kZXZpY2UgJiYK
ICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5ub2RlX3Byb3BzLmNwdV9jb3Jlc19jb3VudCkK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwoKICAgICAgICAgICAgICAgICAg
ICBpZiAoIWRldi0+Z3B1ICYmIChkZXYtPm5vZGVfcHJvcHMuc2ltZF9jb3VudCA+IDApKSB7CiAg
ICArICAgICAgICAgICAgICAgICAgICAgICBpZiAoZGV2LT5ub2RlX3Byb3BzLmNwdV9jb3Jlc19j
b3VudCkKICAgICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2LT51c2VfaW9tbXVf
djIgPSB0cnVlOwogICAgICAgICAgICAgICAgICAgICAgICAgICAgLi4uCgpSZWdhcmRzLArCoCBG
ZWxpeAoKCj4gKwo+ICsJdXBfcmVhZCgmdG9wb2xvZ3lfbG9jayk7Cj4gKwo+ICsJZ3B1LT51c2Vf
aW9tbXVfdjIgPSB0ZW1wID8gdHJ1ZSA6IGZhbHNlOwo+ICt9Cj4gKwo+ICAjaWYgZGVmaW5lZChD
T05GSUdfREVCVUdfRlMpCj4gIAo+ICBpbnQga2ZkX2RlYnVnZnNfaHFkc19ieV9kZXZpY2Uoc3Ry
dWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2FtZC1nZngK
