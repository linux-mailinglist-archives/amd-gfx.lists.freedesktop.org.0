Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A33F37F733
	for <lists+amd-gfx@lfdr.de>; Thu, 13 May 2021 13:53:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1399C6ECFF;
	Thu, 13 May 2021 11:53:36 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56176ECFF
 for <amd-gfx@lists.freedesktop.org>; Thu, 13 May 2021 11:53:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSh/Mhf5Hz6zCe5qekQnSYaHnKoW6epd5ekfLL1/nuc0THKV/4M/MY3/Hm/yFeyNy0E8so8VeUJBDy9+NJlZ4Ocn6pRol8p4Y763FqxXm6eeO7PNGf9KOCpYJS9VpJ/26+mYYe1IbTQfQx+FwmzbrqeaQ3WrJineR3ONQ6sSm+ozkqaTrqdbkSqnsJjsYUTVSjGaqv/YuAlq2ftJ+qkQ+0FHCu6Aqj8YYNjt5L+Iak3D51qtvATv1tGmJshy+6Aiacs+384f7axc3AcBHBC8i5T9PiEd+1D7mpEPJkGdHN21zQXZQhyN5e0HrwZtNpBAvrDrDy3MtGUWmmduYNzSvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1LHp2d3shf+n/H3vbUp/nSaz4T1VFLOJRVSO+aN/II=;
 b=Rl1Ii/H6hMecEGXHyddbAM64ZMFU7uJ1aY0T3/qkKXop+HVVtZD8y9BHiCNJE8efzZNDu32Rid/JufPtGw3naZane9XXn8glPlwUA2S7TiGrRHQ6Q3tu7g5C24b2WBJkYIXKlhIBD65i/sLkxQgmYZ0C2vbv+juF7/sLph3CvLdhJEjN57b8Yv8GYpADkMWARM4oJX40SHohTvc6/naRhO61ljMumfsy5LNLZ+idQxRz4gmS36vdVf6Fm7PPOWGbtcLeb/jWALF0yZI1wamr4r+zMbOp+Hg50LSbeMgLXCVlmZx/RvkCULyW6z3iDsG7Kr1EWY2BGDJCpeHgpSSVKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1LHp2d3shf+n/H3vbUp/nSaz4T1VFLOJRVSO+aN/II=;
 b=1vi3gT7us0oQ1cxOoJO5yVNvTJVvCAc4cb9UldUV/2Yll8EzHbsUJDQk6w62oa6bt4mhjsjIyiRzLmrMsWkcGX+uOQG7hIMKRJvO4lRmMRXnHYAaKZ6tfX9lKkpou9egao8PHTSWp2G8kkcez6XbUQyfBx3VIDLfTTwAXUYPyA0=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH0PR12MB5348.namprd12.prod.outlook.com (2603:10b6:610:d7::9)
 by CH0PR12MB5300.namprd12.prod.outlook.com (2603:10b6:610:d7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 13 May
 2021 11:53:32 +0000
Received: from CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::9c3:508d:5340:8efd]) by CH0PR12MB5348.namprd12.prod.outlook.com
 ([fe80::9c3:508d:5340:8efd%6]) with mapi id 15.20.4129.025; Thu, 13 May 2021
 11:53:32 +0000
Subject: Re: [PATCH 2/3] drm/amd/pm: Fix showing incorrect frequencies on
 aldebaran
To: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <cb35e9cc-26cf-c9e7-b747-c24920d788d6@amd.com>
 <CO6PR12MB547345F347D296F9D5715B8FA2519@CO6PR12MB5473.namprd12.prod.outlook.com>
From: Lijo Lazar <lijo.lazar@amd.com>
Message-ID: <7c9e7ecb-1412-e4f3-9e99-0405327e2713@amd.com>
Date: Thu, 13 May 2021 17:23:20 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <CO6PR12MB547345F347D296F9D5715B8FA2519@CO6PR12MB5473.namprd12.prod.outlook.com>
Content-Language: en-US
X-Originating-IP: [165.204.159.242]
X-ClientProxiedBy: BM1PR0101CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:18::20) To CH0PR12MB5348.namprd12.prod.outlook.com
 (2603:10b6:610:d7::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.39.107] (165.204.159.242) by
 BM1PR0101CA0010.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:18::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Thu, 13 May 2021 11:53:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87d16415-1096-4216-759c-08d91605bade
X-MS-TrafficTypeDiagnostic: CH0PR12MB5300:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH0PR12MB5300B77C53DA0C97D2254B5997519@CH0PR12MB5300.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FwNeqk33LJa/fQUhBRsAByLiR+KndaZssenseNJk7P4C5759n+Qrj7FzX6mPwFCzFZAWDJujJ9JS9sievNGcIZrX1ZMViW+19EpNUf149sf0t1pkSiYjID5GLLNldqsIXD2H0y43FamycowSP2lzZh6Oq9TVvPRYcEPkp4MEJAjEWgwgdl64GPRhPRAZ78P3kG6qyKlWj3nlziNRSV4ZJlVQXkjXHWvFzYsUg3ICOTjgf8jCfw5hBHHlatS/gq9cagrIzuSRxzNqzp7jDsKW8bWcKVPXHJtnjnbQqAiFkDs6m+LrryUENazfkA3tfIbN+fZlJRFsaRgzxQ+R2l1BzILPJ59nz5gH65st4bJMN7GS0QUFNA/yMyKoZieAlFxaj5yHR4k5pfF+Y0T+3pHLyJvzB7VMMd++0Z7CFFPWMvDTuzc/hj6ykqbleGtTrTf3BmRc8CeGVfqWGARHjLuRAwfjb449s9CG6HmYuOtde8oPzULtdirxCEiZs09mcpIy51aJ0TiMecCmipMekjcr89RYBxjsMZXq1blqG9+iIYIiAg2PdQ9fSsOZuF7bnQv7g1Rf9tNpyr+x6H+EiOY/tCCcP4CEbzgmkgwog+3O6TUp3AqIW5UhTGinzIR+QNbeVHsyG83VFSCpgygaec5G29VHANuMozmiBnGf3o+lMQHHZ1acH/VyiUTH221EFlobl+X+SULwhPnEw+tJo0tIvg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5348.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(2906002)(86362001)(4326008)(44832011)(52116002)(31696002)(6666004)(38100700002)(110136005)(66476007)(66556008)(66946007)(956004)(5660300002)(2616005)(31686004)(16576012)(38350700002)(8676002)(316002)(83380400001)(36756003)(26005)(53546011)(6486002)(54906003)(478600001)(186003)(16526019)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c1d2YUFDYXRvbjBpcmdDaWYvTGppUW9DdFl0Vmp0SzdNUVJFZ3pEYWVDcTZL?=
 =?utf-8?B?dlB6Yk8rVU9HQlJYUW9vVmYrOHhUVXk2bk5pV3NWMGtmQ3EycmdIR0MrbWhj?=
 =?utf-8?B?L284YjIzR0FRTzJWVWg3ek4rQXdpSDlOWnVBVnhIUjZRNVNzWDk1WWZUOW1N?=
 =?utf-8?B?ODFIZE5YRHRiVEw2djF3azJIRnl1clFISy9mZEVBTFdPaEs3RmF3MUw1R3U5?=
 =?utf-8?B?ck9XS2V3S0x4L1QyazFTcmlob282ZFEwL0hWVHVCejFucjRkZVNXSnZYMjNR?=
 =?utf-8?B?YnhoNE9rU2lVUFkvbkxKU1hHejlPd2YvK05hVzF1ZTZtc2hqdlBZY0phcVAv?=
 =?utf-8?B?enJOd3dyM2Q5cjY2MDd3Q3dkeHB4ejcycG5wVnJ1S1h4OHBMQlJCRkluUnFS?=
 =?utf-8?B?aVdQUFliMFYwR1lkcWV1UFpYVDU5cUZUZ04yc24wZEhFZlhQYTdRMW5KUVQw?=
 =?utf-8?B?cStRdld6eHJMeXhqUnR3SzN4ajJuRHZWZGdHTlgvNithMk40UzE5T3F3U2I1?=
 =?utf-8?B?RDhoUHlKZWx1alpHd1BjVk53N2k2WURSQUM0RmhOUHN2TlZmZC9EdnA5YXpO?=
 =?utf-8?B?OWtMSU83QW1ReEg2eUMrYldsUXdYWFdKUTZDSjN3eFJKeWdHdmY3b1ZrMVE1?=
 =?utf-8?B?L3loM2djbEJiZjZuUkNYdXdOZXVjYWI0V1NZOWJxejRuNmtJVWF3SmZpSDZl?=
 =?utf-8?B?UEtLN3Ayd1UyanZYYU93TzJQbm9lNEJKb1JRb0p1bVoxZGN3MGxMdjlwQzNh?=
 =?utf-8?B?S2YzZkNBUWF2QkJmM0JUbVN0aVQxU0U1NWZFLzYxWmdmMXZyQTNMOG9QU2Mz?=
 =?utf-8?B?b3I1YU80eHA3ZXYxWWtDQ0VHazU4S3NSRkZuWU1zRUVqelhBZHQyR3RxR3dT?=
 =?utf-8?B?STU1Qk5FcHdzd24vaEN3OGtNa2N3cDVURnVIQVg3NlgwTjZBQkpOcHRneDJw?=
 =?utf-8?B?aU03QTdzMDZPWWF4THJRU1Z4RVBjOU9rWjhiVk45K3B2clRrWFpINDJQTCtX?=
 =?utf-8?B?MHdyS1RnWFc1OXMzMGJDakg0dVJHT21rWVkyYnBzcXgzR250dTdpMytSM1pi?=
 =?utf-8?B?bkl2OVN6UFVSbWhQWlRUcEdtbkJjdkFsaEtNUDRGT1FkNExtZkcrYzZvVnNH?=
 =?utf-8?B?WjEvS2RwOGE2dHZNcDQ1Q2FzVStYRXA2bnVuL1FsUStuUmpXZ2pXMWZERmZq?=
 =?utf-8?B?aFkyd1BGQlNCY1FBcWp2d1hHcVVxaGptKzZnOUNyRVhHUG9pQW5ReDdoQjRh?=
 =?utf-8?B?L0pLSlZCRFNuakRUSmRBOEJEelFZTG1RbDVzOVh4U2hvdHNCR2tSUFRxbGor?=
 =?utf-8?B?OUVGTTRlb3lsazlPNThYUjROV0JMalBSSDNjaFV2ODdkeVNTU0VCMmRtUU54?=
 =?utf-8?B?d0JuMHVuTTNMSlpoT3J2RTNpOExYOHduU05wVWdOUjRBUVNYaEMvSW1NOHMw?=
 =?utf-8?B?d3ltemIydkFSNVhacjVvbTBwb0huTjF5KzJDVER6MHdaR2QybWc3OE1rU2s5?=
 =?utf-8?B?b1hVcStzTzV3cUgwZXhiT0x1aDZMMWdkQTFTMTZpQ2RMMlVhdjFHeEJTMkp4?=
 =?utf-8?B?WnRwTWViTVJPL0RaR1pqaC82SFoxL2dpV1kwclAvMUQvN0hHWWRwZ0hVR2JP?=
 =?utf-8?B?OSsrZVhSenFXUnRCZDZSWEhGMHhPeDNPQ1FvamIwT1NwMUFJUEtlaDFDSXRE?=
 =?utf-8?B?ZUlLM2RNcFpwcEZhVC9xUzFQdjZBRm82aEpaeTJmRHh6bzFnNUpCU00wUll2?=
 =?utf-8?Q?KhqY6VF3uu5e1a45xFVJTz8ShAnHeFkUtiBaBaS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d16415-1096-4216-759c-08d91605bade
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5348.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 11:53:32.6077 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4VtwvdX1K6p6PfJfw9sOKpsFwKEsqnoZzZPh5+1VCH6wT4JGfbsRbEV20piSbI24
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5300
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
Cc: "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

CgpPbiA1LzEzLzIwMjEgNTowNiBQTSwgV2FuZywgS2V2aW4oWWFuZykgd3JvdGU6Cj4gW0FNRCBP
ZmZpY2lhbCBVc2UgT25seSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+IAo+IAo+IAo+
IAo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ICpGcm9tOiogTGF6YXIsIExpam8gPExpam8uTGF6YXJAYW1k
LmNvbT4KPiAqU2VudDoqIFRodXJzZGF5LCBNYXkgMTMsIDIwMjEgNTo0NyBQTQo+ICpUbzoqIGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4KPiAqQ2M6KiBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPjsgRmVuZywg
S2VubmV0aCAKPiA8S2VubmV0aC5GZW5nQGFtZC5jb20+OyBXYW5nLCBLZXZpbihZYW5nKSA8S2V2
aW4xLldhbmdAYW1kLmNvbT4KPiAqU3ViamVjdDoqIFtQQVRDSCAyLzNdIGRybS9hbWQvcG06IEZp
eCBzaG93aW5nIGluY29ycmVjdCBmcmVxdWVuY2llcyBvbiAKPiBhbGRlYmFyYW4KPiAKPiBVc2Ug
dGhlIGN1cnJlbnQgYW5kIGN1c3RvbSBwc3RhdGUgZnJlcXVlbmNpZXMgdG8gdHJhY2sgdGhlIGN1
cnJlbnQgYW5kCj4gdXNlci1zZXQgbWluL21heCB2YWx1ZXMgaW4gbWFudWFsIGFuZCBkZXRlcm1p
bmlzbSBtb2RlLiBQcmV2aW91c2x5LCBvbmx5Cj4gYWN0dWFsXyogdmFsdWUgd2FzIHVzZWQgdG8g
dHJhY2sgdGhlIGN1cnJyZW50IGFuZCB1c2VyIHJlcXVlc3RlZCB2YWx1ZS4KPiBUaGUgdmFsdWUg
d2lsbCBnZXQgcmVhc3NpZ25lZCB3aGVuZXZlciB1c2VyIHJlcXVlc3RzIGEgbmV3IHZhbHVlIHdp
dGgKPiBwcF9vZF9jbGtfdm9sdGFnZSBub2RlLiBIZW5jZSBpdCB3aWxsIHNob3cgaW5jb3JyZWN0
IHZhbHVlcyB3aGVuIHVzZXIKPiByZXF1ZXN0cyBhbiBpbnZhbGlkIHZhbHVlIG9yIHRyaWVzIGEg
cGFydGlhbCByZXF1ZXN0IHdpdGhvdXQgY29tbWl0dGluZwo+IHRoZSB2YWx1ZXMuIFNlcGFyYXRp
bmcgb3V0IHRvIGN1c3RvbSBhbmQgY3VycmVudCB2YXJpYWJsZSBmaXhlcyBzdWNoCj4gaXNzdWVz
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IExpam8gTGF6YXIgPGxpam8ubGF6YXJAYW1kLmNvbT4KPiAt
LS0KPiAgwqAgLi4uL2RybS9hbWQvcG0vc3dzbXUvc211MTMvYWxkZWJhcmFuX3BwdC5jwqDCoMKg
IHwgNjUgKysrKysrKysrKysrLS0tLS0tLQo+ICDCoCAuLi4vZ3B1L2RybS9hbWQvcG0vc3dzbXUv
c211MTMvc211X3YxM18wLmPCoMKgwqAgfCAxOCArKysrLQo+ICDCoCAyIGZpbGVzIGNoYW5nZWQs
IDU1IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL2FsZGViYXJhbl9wcHQuYwo+IGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMy9hbGRlYmFyYW5fcHB0LmMKPiBpbmRleCA1ZDA0
YTFkZmRmZDguLmQyN2VkMjk1NDcwNSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L3BtL3N3c211L3NtdTEzL2FsZGViYXJhbl9wcHQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vc3dzbXUvc211MTMvYWxkZWJhcmFuX3BwdC5jCj4gQEAgLTc4LDggKzc4LDYgQEAKPiAK
PiAgwqAgI2RlZmluZSBzbW5QQ0lFX0VTTV9DVFJMwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDB4MTExMDAzRDAKPiAKPiAtI2RlZmluZSBDTE9DS19WQUxJRCAoMSA8
PCAzMSkKPiAtCj4gIMKgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY21uMmFzaWNfbXNnX21hcHBpbmcK
PiBhbGRlYmFyYW5fbWVzc2FnZV9tYXBbU01VX01TR19NQVhfQ09VTlRdID0gewo+ICDCoMKgwqDC
oMKgwqDCoMKgIE1TR19NQVAoVGVzdE1lc3NhZ2UsICAgICAgICAgICAgICAgICAgICAgICAgIAo+
IFBQU01DX01TR19UZXN0TWVzc2FnZSzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMCksCj4gIMKgwqDCoMKgwqDCoMKgwqAgTVNHX01BUChHZXRTbXVWZXJzaW9uLCAg
ICAgICAgICAgICAgICAgICAgICAgCj4gUFBTTUNfTVNHX0dldFNtdVZlcnNpb24swqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMSksCj4gQEAgLTQ1NSwxMiArNDUzLDE4IEBA
IHN0YXRpYyBpbnQgYWxkZWJhcmFuX3BvcHVsYXRlX3VtZF9zdGF0ZV9jbGsoc3RydWN0Cj4gc211
X2NvbnRleHQgKnNtdSkKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoCBwc3RhdGVfdGFibGUtPmdmeGNs
a19wc3RhdGUubWluID0gZ2Z4X3RhYmxlLT5taW47Cj4gIMKgwqDCoMKgwqDCoMKgwqAgcHN0YXRl
X3RhYmxlLT5nZnhjbGtfcHN0YXRlLnBlYWsgPSBnZnhfdGFibGUtPm1heDsKPiArwqDCoMKgwqDC
oMKgIHBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1pbiA9IGdmeF90YWJsZS0+bWlu
Owo+ICvCoMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1cnIubWF4ID0g
Z2Z4X3RhYmxlLT5tYXg7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT51Y2xr
X3BzdGF0ZS5taW4gPSBtZW1fdGFibGUtPm1pbjsKPiAgwqDCoMKgwqDCoMKgwqDCoCBwc3RhdGVf
dGFibGUtPnVjbGtfcHN0YXRlLnBlYWsgPSBtZW1fdGFibGUtPm1heDsKPiArwqDCoMKgwqDCoMKg
IHBzdGF0ZV90YWJsZS0+dWNsa19wc3RhdGUuY3Vyci5taW4gPSBtZW1fdGFibGUtPm1pbjsKPiAr
wqDCoMKgwqDCoMKgIHBzdGF0ZV90YWJsZS0+dWNsa19wc3RhdGUuY3Vyci5tYXggPSBtZW1fdGFi
bGUtPm1heDsKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoCBwc3RhdGVfdGFibGUtPnNvY2Nsa19wc3Rh
dGUubWluID0gc29jX3RhYmxlLT5taW47Cj4gIMKgwqDCoMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxl
LT5zb2NjbGtfcHN0YXRlLnBlYWsgPSBzb2NfdGFibGUtPm1heDsKPiArwqDCoMKgwqDCoMKgIHBz
dGF0ZV90YWJsZS0+c29jY2xrX3BzdGF0ZS5jdXJyLm1pbiA9IHNvY190YWJsZS0+bWluOwo+ICvC
oMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT5zb2NjbGtfcHN0YXRlLmN1cnIubWF4ID0gc29jX3Rh
YmxlLT5tYXg7Cj4gCj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKGdmeF90YWJsZS0+Y291bnQgPiBB
TERFQkFSQU5fVU1EX1BTVEFURV9HRlhDTEtfTEVWRUwgJiYKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIG1lbV90YWJsZS0+Y291bnQgPiBBTERFQkFSQU5fVU1EX1BTVEFURV9NQ0xLX0xFVkVM
ICYmCj4gQEAgLTY2OSw2ICs2NzMsNyBAQCBzdGF0aWMgaW50IGFsZGViYXJhbl9wcmludF9jbGtf
bGV2ZWxzKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpzbXUsCj4gIMKgIHsKPiAgwqDCoMKgwqDCoMKg
wqDCoCBpbnQgaSwgbm93LCBzaXplID0gMDsKPiAgwqDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0ID0g
MDsKPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBzbXVfdW1kX3BzdGF0ZV90YWJsZSAqcHN0YXRlX3Rh
YmxlID0gJnNtdS0+cHN0YXRlX3RhYmxlOwo+ICDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBwcF9j
bG9ja19sZXZlbHNfd2l0aF9sYXRlbmN5IGNsb2NrczsKPiAgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1
Y3Qgc211XzEzXzBfZHBtX3RhYmxlICpzaW5nbGVfZHBtX3RhYmxlOwo+ICDCoMKgwqDCoMKgwqDC
oMKgIHN0cnVjdCBzbXVfZHBtX2NvbnRleHQgKnNtdV9kcG0gPSAmc211LT5zbXVfZHBtOwo+IEBA
IC03MDMsMTIgKzcwOCw4IEBAIHN0YXRpYyBpbnQgYWxkZWJhcmFuX3ByaW50X2Nsa19sZXZlbHMo
c3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSwKPiAKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZGlzcGxheV9sZXZlbHMgPSBjbG9ja3MubnVtX2xldmVsczsKPiAKPiAtwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtaW5fY2xrID0gc211LT5nZnhfYWN0dWFsX2hhcmRfbWlu
X2ZyZXEgJiBDTE9DS19WQUxJRCA/Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc211LT5nZnhfYWN0dWFsX2hhcmRfbWlu
X2ZyZXEgJiAKPiB+Q0xPQ0tfVkFMSUQgOgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpbmdsZV9kcG1fdGFibGUtPmRw
bV9sZXZlbHNbMF0udmFsdWU7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4X2Ns
ayA9IHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxICYgQ0xPQ0tfVkFMSUQgPwo+IC3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxICYgCj4gfkNMT0NLX1ZBTElEIDoKPiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBzaW5nbGVfZHBtX3RhYmxlLT5kcG1fbGV2ZWxzWzFdLnZhbHVlOwo+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbl9jbGsgPSBwc3RhdGVfdGFibGUtPmdmeGNsa19wc3Rh
dGUuY3Vyci5taW47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4X2NsayA9IHBz
dGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1heDsKPiAKPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZnJlcV92YWx1ZXNbMF0gPSBtaW5fY2xrOwo+ICDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmcmVxX3ZhbHVlc1sxXSA9IG1heF9jbGs7Cj4gQEAgLTEx
MzQsOSArMTEzNSw2IEBAIHN0YXRpYyBpbnQgYWxkZWJhcmFuX3NldF9wZXJmb3JtYW5jZV9sZXZl
bChzdHJ1Y3QKPiBzbXVfY29udGV4dCAqc211LAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJiYgKGxldmVsICE9IAo+IEFNRF9EUE1fRk9SQ0VEX0xF
VkVMX1BFUkZfREVURVJNSU5JU00pKQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzbXVfY21uX3NlbmRfc21jX21zZyhzbXUsIFNNVV9NU0dfRGlzYWJsZURldGVybWluaXNtLCAK
PiBOVUxMKTsKPiAKPiAtwqDCoMKgwqDCoMKgIC8qIFJlc2V0IHVzZXIgbWluL21heCBnZnggY2xv
Y2sgKi8KPiAtwqDCoMKgwqDCoMKgIHNtdS0+Z2Z4X2FjdHVhbF9oYXJkX21pbl9mcmVxID0gMDsK
PiAtwqDCoMKgwqDCoMKgIHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxID0gMDsKPiAKPiAg
wqDCoMKgwqDCoMKgwqDCoCBzd2l0Y2ggKGxldmVsKSB7Cj4gCj4gQEAgLTExNjMsNiArMTE2MSw3
IEBAIHN0YXRpYyBpbnQKPiBhbGRlYmFyYW5fc2V0X3NvZnRfZnJlcV9saW1pdGVkX3JhbmdlKHN0
cnVjdCBzbXVfY29udGV4dCAqc211LAo+ICDCoCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IHNtdV9kcG1fY29udGV4dCAqc211X2RwbSA9ICYoc211LT5zbXVfZHBtKTsKPiAgwqDCoMKgwqDC
oMKgwqDCoCBzdHJ1Y3Qgc211XzEzXzBfZHBtX2NvbnRleHQgKmRwbV9jb250ZXh0ID0gc211X2Rw
bS0+ZHBtX2NvbnRleHQ7Cj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qgc211X3VtZF9wc3RhdGVfdGFi
bGUgKnBzdGF0ZV90YWJsZSA9ICZzbXUtPnBzdGF0ZV90YWJsZTsKPiAgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IHNtdS0+YWRldjsKPiAgwqDCoMKgwqDCoMKg
wqDCoCB1aW50MzJfdCBtaW5fY2xrOwo+ICDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IG1heF9j
bGs7Cj4gQEAgLTExNzYsMTQgKzExNzUsMjAgQEAgc3RhdGljIGludAo+IGFsZGViYXJhbl9zZXRf
c29mdF9mcmVxX2xpbWl0ZWRfcmFuZ2Uoc3RydWN0IHNtdV9jb250ZXh0ICpzbXUsCj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+IAo+ICDCoMKgwqDC
oMKgwqDCoMKgIGlmIChzbXVfZHBtLT5kcG1fbGV2ZWwgPT0gQU1EX0RQTV9GT1JDRURfTEVWRUxf
TUFOVUFMKSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluX2NsayA9IG1heCht
aW4sIGRwbV9jb250ZXh0LT5kcG1fdGFibGVzLmdmeF90YWJsZS5taW4pOwo+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG1heF9jbGsgPSBtaW4obWF4LCBkcG1fY29udGV4dC0+ZHBtX3Rh
Ymxlcy5nZnhfdGFibGUubWF4KTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQg
PSBzbXVfdjEzXzBfc2V0X3NvZnRfZnJlcV9saW1pdGVkX3JhbmdlKHNtdSwgU01VX0dGWENMSywK
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgbWluX2NsaywgCj4gbWF4X2Nsayk7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaWYgKG1pbiA+PSBtYXgpIHsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgZGV2X2VycihzbXUtPmFkZXYtPmRldiwKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJNaW5pbXVtIEdGWCBj
bGsgc2hvdWxkIGJlIGxlc3MgdGhhbiB0aGUgCj4gbWF4aW11bSBhbGxvd2VkIGNsb2NrXG4iKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1F
SU5WQUw7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+IFtrZXZpbl06Cj4g
d2h5IGNhbiB0aGVzZSB2YWx1ZSBub3QgYmUgZXF1YWwgaW4gbWFudWFsIG1vZGU/CgpXZSBhcmUg
aW50ZW50aW9uYWxseSBhdm9pZGluZyB1c2VyIGV4cGVjdGF0aW9uIHRvIHJ1biBhdCBmaXhlZCBj
bG9ja3MuIApUaGUgbWVzc2FnZSBpcyB0byBtYWtlIGl0IGNsZWFyIHRoYXQgaXQgaXMgbm90IGEg
cmVhc29uYWJsZSBleHBlY3RhdGlvbiAKb24gYWxkZWJhcmFuLgoKVGhhbmtzLApMaWpvCgo+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICgobWluID09IHBzdGF0ZV90YWJsZS0+Z2Z4
Y2xrX3BzdGF0ZS5jdXJyLm1pbikgJiYKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIChtYXggPT0gcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1cnIubWF4KSkKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc211X3YxM18wX3NldF9zb2Z0X2Zy
ZXFfbGltaXRlZF9yYW5nZShzbXUsIFNNVV9HRlhDTEssCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbiwgbWF4KTsKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFyZXQpIHsKPiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc211LT5nZnhfYWN0dWFsX2hhcmRfbWlu
X2ZyZXEgPSBtaW5fY2xrIHwgCj4gQ0xPQ0tfVkFMSUQ7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxID0g
bWF4X2NsayB8IAo+IENMT0NLX1ZBTElEOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBwc3RhdGVfdGFibGUtPmdmeGNsa19wc3RhdGUuY3Vyci5taW4gPSBt
aW47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0
ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1heCA9IG1heDsKPiAgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gcmV0Owo+ICDCoMKgwqDCoMKgwqDCoMKgIH0KPiBAQCAtMTIwOSwxMCArMTIxNCw4IEBA
IHN0YXRpYyBpbnQKPiBhbGRlYmFyYW5fc2V0X3NvZnRfZnJlcV9saW1pdGVkX3JhbmdlKHN0cnVj
dCBzbXVfY29udGV4dCAqc211LAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoYWRldi0+ZGV2LAo+ICDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIkZhaWxlZCB0byBlbmFibGUgCj4g
ZGV0ZXJtaW5pc20gYXQgR0ZYIGNsb2NrICVkIE1IelxuIiwgbWF4KTsKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzbXUt
PmdmeF9hY3R1YWxfaGFyZF9taW5fZnJlcSA9Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluX2Ns
ayB8IENMT0NLX1ZBTElEOwo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc211LT5nZnhfYWN0dWFsX3NvZnRfbWF4X2ZyZXEgPQo+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1heCB8IENMT0NLX1ZBTElEOwo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHN0YXRlX3Rh
YmxlLT5nZnhjbGtfcHN0YXRlLmN1cnIubWluID0gCj4gbWluX2NsazsKPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90
YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1heCA9IG1heDsKPiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+ICDCoMKgwqDCoMKgwqDCoMKgIH0KPiBAQCAtMTIyNSw2ICsxMjI4LDcg
QEAgc3RhdGljIGludCBhbGRlYmFyYW5fdXNyX2VkaXRfZHBtX3RhYmxlKHN0cnVjdAo+IHNtdV9j
b250ZXh0ICpzbXUsIGVudW0gUFBfT0RfRFBNXwo+ICDCoCB7Cj4gIMKgwqDCoMKgwqDCoMKgwqAg
c3RydWN0IHNtdV9kcG1fY29udGV4dCAqc211X2RwbSA9ICYoc211LT5zbXVfZHBtKTsKPiAgwqDC
oMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgc211XzEzXzBfZHBtX2NvbnRleHQgKmRwbV9jb250ZXh0ID0g
c211X2RwbS0+ZHBtX2NvbnRleHQ7Cj4gK8KgwqDCoMKgwqDCoCBzdHJ1Y3Qgc211X3VtZF9wc3Rh
dGVfdGFibGUgKnBzdGF0ZV90YWJsZSA9ICZzbXUtPnBzdGF0ZV90YWJsZTsKPiAgwqDCoMKgwqDC
oMKgwqDCoCB1aW50MzJfdCBtaW5fY2xrOwo+ICDCoMKgwqDCoMKgwqDCoMKgIHVpbnQzMl90IG1h
eF9jbGs7Cj4gIMKgwqDCoMKgwqDCoMKgwqAgaW50IHJldCA9IDA7Cj4gQEAgLTEyNDUsMTYgKzEy
NDksMjAgQEAgc3RhdGljIGludCBhbGRlYmFyYW5fdXNyX2VkaXRfZHBtX3RhYmxlKHN0cnVjdAo+
IHNtdV9jb250ZXh0ICpzbXUsIGVudW0gUFBfT0RfRFBNXwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGlucHV0WzFdIDwgCj4gZHBtX2NvbnRl
eHQtPmRwbV90YWJsZXMuZ2Z4X3RhYmxlLm1pbikgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKHNtdS0+
YWRldi0+ZGV2LCAiTWluaW11bSBHRlggCj4gY2xrICglbGQpIE1IeiBzcGVjaWZpZWQgaXMKPiBs
ZXNzIHRoYW4gdGhlIG1pbmltdW0gYWxsb3dlZCAoJWQpIE1IelxuIiwKPiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaW5wdXRbMV0sIAo+IGRwbV9jb250ZXh0LT5kcG1fdGFibGVzLmdmeF90YWJs
ZS5taW4pOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1c3RvbS5taW4gPQo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBwc3RhdGVfdGFibGUt
PmdmeGNsa19wc3RhdGUuY3Vyci5taW47Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtdS0+Z2Z4X2FjdHVhbF9o
YXJkX21pbl9mcmVxID0gaW5wdXRbMV07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXN0b20ubWluID0g
aW5wdXRbMV07Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSBpZiAo
aW5wdXRbMF0gPT0gMSkgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKGlucHV0WzFdID4gCj4gZHBtX2NvbnRleHQtPmRwbV90YWJsZXMuZ2Z4
X3RhYmxlLm1heCkgewo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl93YXJuKHNtdS0+YWRldi0+ZGV2LCAiTWF4aW11
bSBHRlggCj4gY2xrICglbGQpIE1IeiBzcGVjaWZpZWQgaXMKPiBncmVhdGVyIHRoYW4gdGhlIG1h
eGltdW0gYWxsb3dlZCAoJWQpIE1IelxuIiwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5w
dXRbMV0sIAo+IGRwbV9jb250ZXh0LT5kcG1fdGFibGVzLmdmeF90YWJsZS5tYXgpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
cHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1c3RvbS5tYXggPQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBwc3RhdGVfdGFibGUtPmdmeGNsa19wc3RhdGUu
Y3Vyci5tYXg7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxID0g
aW5wdXRbMV07Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXN0b20ubWF4ID0gaW5wdXRbMV07Cj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IEBAIC0xMjc2LDggKzEyODQsMTUgQEAg
c3RhdGljIGludCBhbGRlYmFyYW5fdXNyX2VkaXRfZHBtX3RhYmxlKHN0cnVjdAo+IHNtdV9jb250
ZXh0ICpzbXUsIGVudW0gUFBfT0RfRFBNXwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2X2VycihzbXUtPmFkZXYtPmRldiwgIklucHV0IHBhcmFt
ZXRlciAKPiBudW1iZXIgbm90IGNvcnJlY3RcbiIpOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4gIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG1pbl9jbGsgPSBzbXUtPmdmeF9hY3R1YWxfaGFyZF9taW5f
ZnJlcTsKPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWF4
X2NsayA9IHNtdS0+Z2Z4X2FjdHVhbF9zb2Z0X21heF9mcmVxOwo+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3Bz
dGF0ZS5jdXN0b20ubWluKQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1c3Rv
bS5taW4gPQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKPiBwc3Rh
dGVfdGFibGUtPmdmeGNsa19wc3RhdGUuY3Vyci5taW47Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRl
LmN1c3RvbS5tYXgpCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwc3RhdGVfdGFibGUtPmdmeGNsa19wc3RhdGUuY3VzdG9tLm1h
eCA9Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IHBzdGF0ZV90
YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1heDsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgbWluX2NsayA9IHBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0
ZS5jdXN0b20ubWluOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBtYXhfY2xrID0gcHN0YXRlX3RhYmxlLT5nZnhjbGtfcHN0YXRlLmN1c3RvbS5tYXg7Cj4g
Kwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIAo+IGFsZGViYXJhbl9zZXRfc29mdF9mcmVxX2xpbWl0ZWRfcmFuZ2Uoc211LCBTTVVfR0ZY
Q0xLLAo+IG1pbl9jbGssIG1heF9jbGspOwo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCB9Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL3NtdV92MTNfMC5jCj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL3BtL3N3c211L3NtdTEzL3NtdV92MTNfMC5jCj4gaW5kZXgg
MDg2NDA4M2U3NDM1Li43NTViZGRhZjZjNGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9wbS9zd3NtdS9zbXUxMy9zbXVfdjEzXzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvcG0vc3dzbXUvc211MTMvc211X3YxM18wLmMKPiBAQCAtMTYyNCw4ICsxNjI0LDEyIEBAIGlu
dCBzbXVfdjEzXzBfc2V0X3BlcmZvcm1hbmNlX2xldmVsKHN0cnVjdAo+IHNtdV9jb250ZXh0ICpz
bXUsCj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBTTVVfR0ZYQ0xLLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2Nsa19taW4sCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
Y2xrX21heCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90YWJsZS0+Z2Z4Y2xrX3BzdGF0ZS5jdXJyLm1pbiA9
IHNjbGtfbWluOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBwc3RhdGVfdGFibGUtPmdmeGNsa19wc3RhdGUuY3Vyci5tYXggPSBzY2xrX21heDsKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4gIMKgwqDCoMKgwqDCoMKgwqAgfQo+IAo+ICDC
oMKgwqDCoMKgwqDCoMKgIGlmIChtY2xrX21pbiAmJiBtY2xrX21heCkgewo+IEBAIC0xNjMzLDgg
KzE2MzcsMTIgQEAgaW50IHNtdV92MTNfMF9zZXRfcGVyZm9ybWFuY2VfbGV2ZWwoc3RydWN0Cj4g
c211X2NvbnRleHQgKnNtdSwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNNVV9NQ0xLLAo+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWNsa19taW4s
Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtY2xrX21heCk7Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJldCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KSB7Cj4gIMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Owo+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90YWJsZS0+dWNsa19wc3RhdGUu
Y3Vyci5taW4gPSBtY2xrX21pbjsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgcHN0YXRlX3RhYmxlLT51Y2xrX3BzdGF0ZS5jdXJyLm1heCA9IG1jbGtfbWF4
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPiAgwqDCoMKgwqDCoMKgwqDCoCB9
Cj4gCj4gIMKgwqDCoMKgwqDCoMKgwqAgaWYgKHNvY2Nsa19taW4gJiYgc29jY2xrX21heCkgewo+
IEBAIC0xNjQyLDggKzE2NTAsMTIgQEAgaW50IHNtdV92MTNfMF9zZXRfcGVyZm9ybWFuY2VfbGV2
ZWwoc3RydWN0Cj4gc211X2NvbnRleHQgKnNtdSwKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNNVV9TT0NDTEssCj4gIMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzb2NjbGtfbWluLAo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc29jY2xrX21heCk7Cj4gLcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KSB7Cj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gcmV0Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90
YWJsZS0+c29jY2xrX3BzdGF0ZS5jdXJyLm1pbiA9IHNvY2Nsa19taW47Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBzdGF0ZV90YWJsZS0+c29jY2xrX3Bz
dGF0ZS5jdXJyLm1heCA9IHNvY2Nsa19tYXg7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+ICDCoMKgwqDCoMKgwqDCoMKgIH0KPiAKPiAgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
cmV0Owo+IC0tIAo+IDIuMTcuMQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYW1kLWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9h
bWQtZ2Z4Cg==
