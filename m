Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF02FCA2B
	for <lists+amd-gfx@lfdr.de>; Wed, 20 Jan 2021 06:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D396E12E;
	Wed, 20 Jan 2021 05:01:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F31CE6E12E;
 Wed, 20 Jan 2021 05:01:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HXV8P2VjhVQ3iz075eLirhYIgnYFgqWBORLAY/jrqVqA8LoHZj/ZWwTVhls1HEYIJsMSy8m4vLhhC+hujgLtt7WdruoMrSDB0k0WMQkDhHX45mqo9MBcup6LrmOs4hpQBSbg11wiJuDjhMbu1G4icZX69QoO5kdtOXq3lmiqu6VWGhf+VOwtepAQ0eeszU9QOP7Di3yJ950ZWMzXolfUyxXb4Vk42TgG91JmtEi4F5PB3JxY5yAFRr/mUwzSbiuMt4WbD6aLFuJMF4nYDNeCOqPfJvhluBt8U+PeDaieiw81gynkfSZlqFnCxVyxCrUxeF227jTO/D+PmEfXjPwZVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCF8IfkwQn7/6m/GZl5S0T9jJdbCJBLsoorchuleyNM=;
 b=lTVkVlb9iXzpN5OIMGDRB3CMXVLc6mQIMP3q4nZd5So7K3TEfJEnPoNfGLJRKAQoCEKC5m3mP+aEaR1JDWGzsDJh/aEBoAoeoxXL+7BlBAo+WZF4cBxH88csIbvFZ2qNca51eUIMWlTsVBjiTcS6MEcPjWuz9Vq/w8KRCYw+4LtIXwOU72uPjhe6woDrV6vwz/IITLzzl6S6+ffFgKH1WeA/eBQMj6o9EUDI+ONziaL1V8swhXTwCef0kQd8bxMveXMsC6ywjvxtODP07UTJKyEQMzHvOGwqJxwT1oqr3gmENcxw7n+EQpzu4EyAfmQG5/ouvgUrLi+KypvrE98Qkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mCF8IfkwQn7/6m/GZl5S0T9jJdbCJBLsoorchuleyNM=;
 b=NSQBJaVzwK/6sevntD6QmykLG1FZdKJAFHSKyg9prH6npZSQxGRC3AnubAGBGkr+Hxh62E8bIdbXlIUR35zLz84iiF/+ztLOzfjxngAy9mIt9pN1eerAL5Y8luzCk6AwvDjkiXuDJGWQep50B35fmKm4Zz652dPpepcCp3VTTbY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2798.namprd12.prod.outlook.com (2603:10b6:805:69::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Wed, 20 Jan
 2021 05:01:15 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Wed, 20 Jan 2021
 05:01:15 +0000
Subject: Re: [PATCH v4 07/14] drm/amdgpu: Register IOMMU topology notifier per
 device.
To: christian.koenig@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-8-git-send-email-andrey.grodzovsky@amd.com>
 <2978ebf8-858d-6e8e-5657-1d0d615d56e0@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <2e6b1fd8-d20f-ce57-44f2-f679d1530ff9@amd.com>
Date: Wed, 20 Jan 2021 00:01:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <2978ebf8-858d-6e8e-5657-1d0d615d56e0@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
X-ClientProxiedBy: YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::26) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:c1b5:6dec:d289:5430]
 (2607:fea8:3edf:49b0:c1b5:6dec:d289:5430) by
 YTOPR0101CA0049.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Wed, 20 Jan 2021 05:01:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c21c3e1e-e72b-4b72-c32d-08d8bd006a51
X-MS-TrafficTypeDiagnostic: SN6PR12MB2798:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2798C929EF80278B8D677491EAA20@SN6PR12MB2798.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jzy3brQVKO3+G40gL86rysH3Mm8DK6o2Zg4TsYTmd5J5oR/KfW1NO3/ejpjYvlbm6VFCSmYhLmCzXoWvmpO8TXDVNFMzzD9wOj5V+QJ/IOvV62O6e9vY0/nlQNm1D/q/QwoprJ2spgXKkkAP6wmfiFXjMh3ht7o4giM5VrrLQ3XvYxnTIEC0mlGHldVybcqqej8A3OIzKUbQ7eP1iYREEzKZrqNzMpGi+pg40x9HrO4xUg5vfqyvLA9tKCGAp/r8ZMkzCRH7h/7xsMRH6CRlqWRgz73roHV7RhoJybV7KVzN1rGJeCsQt9Dy2rZ7vw6dgpMmPRLnVNqlJM/zDxf1cf+rygdizhlBMH/gLCsg/CyQqPiJnuA+4Dj1xgwbwjMm3D/BrFeNdy7jbaXYrtyvIqIqn6taQvYmpzDAZm4tacqCFCDNJ3XaHwX5Ec3CPndPxoj6L1aD2oXfgpcLI2IIlIIoTgM0GpO9TAFMADrC6xE+hNHKymILo8hQlqqiWeq/sKLFzxcYeDjqXLRmTQdLjw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(45080400002)(5660300002)(36756003)(4326008)(52116002)(2616005)(53546011)(6486002)(478600001)(16526019)(86362001)(966005)(316002)(66574015)(66556008)(31696002)(2906002)(31686004)(186003)(6666004)(8676002)(8936002)(83380400001)(66946007)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YncwemhGc0V1RExWWHMycWhGRTJwV0IzcWo4MGxxNWd1S2c1eGdUeUI4Zy8z?=
 =?utf-8?B?V1h1NzZ4YkRNVGd2WDhHRHUxNnkrWG12b0hSSFFrSVA2TUFzaE03SjJMdWNR?=
 =?utf-8?B?LzRzQUgzeCsvWnVxcTZoci9aU0RSRWhvZlBuNlBUcVZaeDM2RjFRM2FuV0hY?=
 =?utf-8?B?dHhEeVozbHphQlRTeUV3bldwUWl4OGpDam1BQ1F6dVJGQkRIR2Z0NEJsNUgx?=
 =?utf-8?B?bUwySis2Qmo4YnlIUUZ2TUV4SjFqS1pLZjJRbnBjSXIrOGxVdUV6eERwL0ti?=
 =?utf-8?B?OTRVL3c0UkZ1ZkVvU2NWaHBsL01XdjcvdWQvd2NUMk5WNUtxVDNjbXlyRHdM?=
 =?utf-8?B?eHJOMWJTb0xLREdjUzdWbXhlci9SVXVZVzlQNlJJSVJISllUajNNUlBPaWxr?=
 =?utf-8?B?K0tOR0x6T3lRTmFoZnZNYVh1RlQzSkU4ZEZvaVNieGNNL0RENzJ3aGd3bGIv?=
 =?utf-8?B?dXNZM29TTi9YSkpwM3Y5WU00T0tzclE1ZlQxa0Z6MytCQTVlSHRDc3VQUzNL?=
 =?utf-8?B?QS9DUFhEcldmY1ZPSFVnZGJsK2o3b2EvSDhxb29DazNJd05iUzl6ZnhtRUNz?=
 =?utf-8?B?cDVUU3daOWdMK0VEeUQ3OUZpTmwvRVhNSUdsSWJ6Q05hd29Mbk9YNWFkMnNu?=
 =?utf-8?B?TFFHRXM0dmlWb3dmNXVWbi9tVjJ0bjY1RHVKV3VNZXNwMDJTc2JCeWhzRmVm?=
 =?utf-8?B?Rm5DNEtOalpEMjFCM1FxUk1nZHI4emkwcjBodzhjTDR1dWc1d0Mwd3B1eURq?=
 =?utf-8?B?eCtiUit6b3Y1OFgxWE9LMStqb0l3a3BPYWJkUEtEVkRPa3Nybjl5MllIVkpy?=
 =?utf-8?B?VS9QekZHSWtNQXB0cXc0Uk9Rc08vait3NGVHRmNONEwvbTB3Rm80cDY1OEcw?=
 =?utf-8?B?QURpa0lXM0VEbWVYOFNqcTlYaENlNWtxa1ArSDN6K2tkNng2aG95RUZnVFFP?=
 =?utf-8?B?c2duZlhJZnduNU80NitlcWM1Ym0yRjJCTTZXNVFYbnhXL0JBYjVscWVOSTNv?=
 =?utf-8?B?ZDVFcHA3WDZzdFowaGdyK2NhK0w0MWJVNmdwd3p3cDRFK0ZoWGRKcFlsbnpO?=
 =?utf-8?B?eGhSSkw0SXFiZW83NkVOa0JDellIdG9icDhIbldIeVNnWnZNYWdzcXhWMjJi?=
 =?utf-8?B?WFRHc3pOTzNiNGE5S3dVeVM1amlNMEhsTlBLUytwTzRINm5DYkxLcUYrKzVP?=
 =?utf-8?B?V0lydkpQbEt3WENiWDZ1QjBzTU1VNGpUTTE3UjVLQ3ltV3BPV0g4NGx3TXB5?=
 =?utf-8?B?SS9PR2h3VDYzM2ZTRis3dFF2YVlQb2NoOEFHdUQ4ZVFGenBTMXB2WVpRWFlD?=
 =?utf-8?B?ZVBIL2FhUHlaZ2ZEcEdLazZkS3ZoWjFqYllweDZqOGNsMkh2eDBULzBVU1NT?=
 =?utf-8?B?QjJrMnBXUUx5b2V5ejJHL3hmdDNrdnNUb2lRUHpJbUdnS0ZNaXFpb0JxRGFt?=
 =?utf-8?B?NG5sM2lUNWpyVW4wN21IUERNTS9VWDdEcVdJS1g3NHU4OHZqVmJ3Y1VqdEsr?=
 =?utf-8?B?elFkSnM1bnVHdzV4NThaUlljdms5OHY1RTdLK2lkZjc5OHZKL2JVaDVYSllH?=
 =?utf-8?B?MDZ4dz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21c3e1e-e72b-4b72-c32d-08d8bd006a51
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2021 05:01:15.5857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jNl0X+Rkx268FRwUYMozxzZjtzgDabKM9Ub0GsVExthanMdvgCMmJLiMnLLjqqM/kgfdLfsSBHSaEoBlbRCNZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2798
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, ppaalanen@gmail.com,
 Harry.Wentland@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

Ck9uIDEvMTkvMjEgMzo0OCBBTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBBbSAxOC4wMS4y
MSB1bSAyMjowMSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+PiBIYW5kbGUgYWxsIERNQSBJ
T01NVSBncm9wdXAgcmVsYXRlZCBkZXBlbmRlbmNpZXMgYmVmb3JlIHRoZQo+PiBncm91cCBpcyBy
ZW1vdmVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdS5owqDCoMKgwqDCoMKgwqAgfMKgIDUgKysrKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuY8KgwqAg
fMKgIDIgKy0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuaMKg
wqAgfMKgIDEgKwo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0
LmMgfCAxMCArKysrKysrCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9v
YmplY3QuaCB8wqAgMiArKwo+PiDCoCA2IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5oCj4+
IGluZGV4IDQ3OGE3ZDguLjI5NTM0MjAgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdS5oCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdS5oCj4+IEBAIC01MSw2ICs1MSw3IEBACj4+IMKgICNpbmNsdWRlIDxsaW51eC9kbWEtZmVu
Y2UuaD4KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+PiDCoCAjaW5jbHVkZSA8bGludXgv
YWVyLmg+Cj4+ICsjaW5jbHVkZSA8bGludXgvbm90aWZpZXIuaD4KPj4gwqAgwqAgI2luY2x1ZGUg
PGRybS90dG0vdHRtX2JvX2FwaS5oPgo+PiDCoCAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmg+Cj4+IEBAIC0xMDQxLDYgKzEwNDIsMTAgQEAgc3RydWN0IGFtZGdwdV9kZXZpY2Ugewo+
PiDCoCDCoMKgwqDCoMKgIGJvb2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgaW5fcGNpX2Vycl9yZWNvdmVyeTsKPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgcGNpX3NhdmVkX3N0YXRlwqDCoMKgwqDCoMKgwqDCoMKgICpwY2lfc3RhdGU7Cj4+ICsKPj4g
K8KgwqDCoCBzdHJ1Y3Qgbm90aWZpZXJfYmxvY2vCoMKgwqDCoMKgwqDCoCBuYjsKPj4gK8KgwqDC
oCBzdHJ1Y3QgYmxvY2tpbmdfbm90aWZpZXJfaGVhZMKgwqDCoCBub3RpZmllcjsKPj4gK8KgwqDC
oCBzdHJ1Y3QgbGlzdF9oZWFkwqDCoMKgwqDCoMKgwqAgZGV2aWNlX2JvX2xpc3Q7Cj4+IMKgIH07
Cj4+IMKgIMKgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGFtZGdwdV9kZXZpY2UgKmRybV90b19hZGV2
KHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2KQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZXZpY2UuYwo+PiBpbmRleCA0NWUyM2UzLi5lOTlmNGYxIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+IEBAIC03MCw2ICs3
MCw4IEBACj4+IMKgICNpbmNsdWRlIDxkcm0vdGFza19iYXJyaWVyLmg+Cj4+IMKgICNpbmNsdWRl
IDxsaW51eC9wbV9ydW50aW1lLmg+Cj4+IMKgICsjaW5jbHVkZSA8bGludXgvaW9tbXUuaD4KPj4g
Kwo+PiDCoCBNT0RVTEVfRklSTVdBUkUoImFtZGdwdS92ZWdhMTBfZ3B1X2luZm8uYmluIik7Cj4+
IMKgIE1PRFVMRV9GSVJNV0FSRSgiYW1kZ3B1L3ZlZ2ExMl9ncHVfaW5mby5iaW4iKTsKPj4gwqAg
TU9EVUxFX0ZJUk1XQVJFKCJhbWRncHUvcmF2ZW5fZ3B1X2luZm8uYmluIik7Cj4+IEBAIC0zMjAw
LDYgKzMyMDIsMzkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGUgKmFtZGdwdV9kZXZf
YXR0cmlidXRlc1tdIAo+PiA9IHsKPj4gwqAgfTsKPj4gwqAgwqAgK3N0YXRpYyBpbnQgYW1kZ3B1
X2lvbW11X2dyb3VwX25vdGlmaWVyKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIsCj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgYWN0aW9u
LCB2b2lkICpkYXRhKQo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
ID0gY29udGFpbmVyX29mKG5iLCBzdHJ1Y3QgYW1kZ3B1X2RldmljZSwgbmIpOwo+PiArwqDCoMKg
IHN0cnVjdCBhbWRncHVfYm8gKmJvID0gTlVMTDsKPj4gKwo+PiArwqDCoMKgIC8qCj4+ICvCoMKg
wqDCoCAqIEZvbGxvd2luZyBpcyBhIHNldCBvZiBJT01NVSBncm91cCBkZXBlbmRlbmNpZXMgdGFr
ZW4gY2FyZSBvZiBiZWZvcmUKPj4gK8KgwqDCoMKgICogZGV2aWNlJ3MgSU9NTVUgZ3JvdXAgaXMg
cmVtb3ZlZAo+PiArwqDCoMKgwqAgKi8KPj4gK8KgwqDCoCBpZiAoYWN0aW9uID09IElPTU1VX0dS
T1VQX05PVElGWV9ERUxfREVWSUNFKSB7Cj4+ICsKPj4gK8KgwqDCoMKgwqDCoMKgIHNwaW5fbG9j
aygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+PiArwqDCoMKgwqDCoMKgwqAgbGlzdF9mb3JfZWFj
aF9lbnRyeShibywgJmFkZXYtPmRldmljZV9ib19saXN0LCBibykgewo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBpZiAoYm8tPnRiby50dG0pCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgdHRtX3R0X3VucG9wdWxhdGUoYm8tPnRiby5iZGV2LCBiby0+dGJvLnR0bSk7Cj4+ICvC
oMKgwqDCoMKgwqDCoCB9Cj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmdHRtX2JvX2ds
b2IubHJ1X2xvY2spOwo+Cj4gVGhhdCBhcHByb2FjaCB3b24ndCB3b3JrLiB0dG1fdHRfdW5wb3B1
bGF0ZSgpIG1pZ2h0IHNsZWVwIG9uIGFuIElPTU1VIGxvY2suCj4KPiBZb3UgbmVlZCB0byB1c2Ug
YSBtdXRleCBoZXJlIG9yIGV2ZW4gYmV0dGVyIG1ha2Ugc3VyZSB5b3UgY2FuIGFjY2VzcyB0aGUg
Cj4gZGV2aWNlX2JvX2xpc3Qgd2l0aG91dCBhIGxvY2sgaW4gdGhpcyBtb21lbnQuCj4KPiBDaHJp
c3RpYW4uCgoKSSBjYW4gdGhpbmsgb2Ygc3dpdGNoaW5nIHRvIFJDVSBsaXN0ID8gT3RoZXJ3aXNl
LCBlbGVtZW50cyBhcmUgYWRkZWQKb24gQk8gY3JlYXRlIGFuZCBkZWxldGVkIG9uIEJPIGRlc3Ry
b3ksIGhvdyBjYW4gaSBwcmV2ZW50IGFueSBvZiB0aG9zZSBmcm9tCmhhcHBlbmluZyB3aGlsZSBp
biB0aGlzIHNlY3Rpb24gYmVzaWRlcyBtdXRleCA/IE1ha2UgYSBjb3B5IGxpc3QgYW5kIHJ1biBv
dmVyIGl0IAppbnN0ZWFkID8KCkFuZHJleQoKCj4KPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgaWYg
KGFkZXYtPmlycS5paC51c2VfYnVzX2FkZHIpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFt
ZGdwdV9paF9yaW5nX2ZpbmkoYWRldiwgJmFkZXYtPmlycS5paCk7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBpZiAoYWRldi0+aXJxLmloMS51c2VfYnVzX2FkZHIpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGFtZGdwdV9paF9yaW5nX2ZpbmkoYWRldiwgJmFkZXYtPmlycS5paDEpOwo+PiArwqDCoMKg
wqDCoMKgwqAgaWYgKGFkZXYtPmlycS5paDIudXNlX2J1c19hZGRyKQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBhbWRncHVfaWhfcmluZ19maW5pKGFkZXYsICZhZGV2LT5pcnEuaWgyKTsKPj4g
Kwo+PiArwqDCoMKgwqDCoMKgwqAgYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9maW5pKGFkZXYpOwo+
PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIHJldHVybiBOT1RJRllfT0s7Cj4+ICt9Cj4+ICsK
Pj4gKwo+PiDCoCAvKioKPj4gwqDCoCAqIGFtZGdwdV9kZXZpY2VfaW5pdCAtIGluaXRpYWxpemUg
dGhlIGRyaXZlcgo+PiDCoMKgICoKPj4gQEAgLTMzMDQsNiArMzMzOSw4IEBAIGludCBhbWRncHVf
ZGV2aWNlX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+IMKgIMKgwqDCoMKgwqAg
SU5JVF9XT1JLKCZhZGV2LT54Z21pX3Jlc2V0X3dvcmssIGFtZGdwdV9kZXZpY2VfeGdtaV9yZXNl
dF9mdW5jKTsKPj4gwqAgK8KgwqDCoCBJTklUX0xJU1RfSEVBRCgmYWRldi0+ZGV2aWNlX2JvX2xp
c3QpOwo+PiArCj4+IMKgwqDCoMKgwqAgYWRldi0+Z2Z4LmdmeF9vZmZfcmVxX2NvdW50ID0gMTsK
Pj4gwqDCoMKgwqDCoCBhZGV2LT5wbS5hY19wb3dlciA9IHBvd2VyX3N1cHBseV9pc19zeXN0ZW1f
c3VwcGxpZWQoKSA+IDA7Cj4+IMKgIEBAIC0zNTc1LDYgKzM2MTIsMTUgQEAgaW50IGFtZGdwdV9k
ZXZpY2VfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKPj4gwqDCoMKgwqDCoCBpZiAo
YW1kZ3B1X2RldmljZV9jYWNoZV9wY2lfc3RhdGUoYWRldi0+cGRldikpCj4+IMKgwqDCoMKgwqDC
oMKgwqDCoCBwY2lfcmVzdG9yZV9zdGF0ZShwZGV2KTsKPj4gwqAgK8KgwqDCoCBCTE9DS0lOR19J
TklUX05PVElGSUVSX0hFQUQoJmFkZXYtPm5vdGlmaWVyKTsKPj4gK8KgwqDCoCBhZGV2LT5uYi5u
b3RpZmllcl9jYWxsID0gYW1kZ3B1X2lvbW11X2dyb3VwX25vdGlmaWVyOwo+PiArCj4+ICvCoMKg
wqAgaWYgKGFkZXYtPmRldi0+aW9tbXVfZ3JvdXApIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHIgPSBp
b21tdV9ncm91cF9yZWdpc3Rlcl9ub3RpZmllcihhZGV2LT5kZXYtPmlvbW11X2dyb3VwLCAmYWRl
di0+bmIpOwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKHIpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGdvdG8gZmFpbGVkOwo+PiArwqDCoMKgIH0KPj4gKwo+PiDCoMKgwqDCoMKgIHJldHVybiAw
Owo+PiDCoCDCoCBmYWlsZWQ6Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZ2FydC5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV9nYXJ0LmMKPj4gaW5kZXggMGRiOTMzMC4uNDg2YWQ2ZCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5jCj4+IEBAIC05Miw3ICs5Miw3IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlIAo+PiAq
YWRldikKPj4gwqDCoCAqCj4+IMKgwqAgKiBGcmVlcyB0aGUgZHVtbXkgcGFnZSB1c2VkIGJ5IHRo
ZSBkcml2ZXIgKGFsbCBhc2ljcykuCj4+IMKgwqAgKi8KPj4gLXN0YXRpYyB2b2lkIGFtZGdwdV9n
YXJ0X2R1bW15X3BhZ2VfZmluaShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPj4gK3ZvaWQg
YW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQo+
PiDCoCB7Cj4+IMKgwqDCoMKgwqAgaWYgKCFhZGV2LT5kdW1teV9wYWdlX2FkZHIpCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm47Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZ2FydC5oIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9nYXJ0LmgKPj4gaW5kZXggYWZhMmUyOC4uNTY3OGQ5YyAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dhcnQuaAo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2FydC5oCj4+IEBAIC02MSw2ICs2MSw3IEBAIGludCBh
bWRncHVfZ2FydF90YWJsZV92cmFtX3BpbihzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldik7Cj4+
IMKgIHZvaWQgYW1kZ3B1X2dhcnRfdGFibGVfdnJhbV91bnBpbihzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldik7Cj4+IMKgIGludCBhbWRncHVfZ2FydF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKPj4gwqAgdm9pZCBhbWRncHVfZ2FydF9maW5pKHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KTsKPj4gK3ZvaWQgYW1kZ3B1X2dhcnRfZHVtbXlfcGFnZV9maW5pKHN0cnVjdCBhbWRn
cHVfZGV2aWNlICphZGV2KTsKPj4gwqAgaW50IGFtZGdwdV9nYXJ0X3VuYmluZChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldiwgdWludDY0X3Qgb2Zmc2V0LAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpbnQgcGFnZXMpOwo+PiDCoCBpbnQgYW1kZ3B1X2dhcnRfbWFwKHN0cnVj
dCBhbWRncHVfZGV2aWNlICphZGV2LCB1aW50NjRfdCBvZmZzZXQsCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMgCj4+IGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCj4+IGluZGV4IDZjYzk5MTkuLjRhMWRl
NjkgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmpl
Y3QuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMK
Pj4gQEAgLTk0LDYgKzk0LDEwIEBAIHN0YXRpYyB2b2lkIGFtZGdwdV9ib19kZXN0cm95KHN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqdGJvKQo+PiDCoMKgwqDCoMKgIH0KPj4gwqDCoMKgwqDCoCBh
bWRncHVfYm9fdW5yZWYoJmJvLT5wYXJlbnQpOwo+PiDCoCArwqDCoMKgIHNwaW5fbG9jaygmdHRt
X2JvX2dsb2IubHJ1X2xvY2spOwo+PiArwqDCoMKgIGxpc3RfZGVsKCZiby0+Ym8pOwo+PiArwqDC
oMKgIHNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4+ICsKPj4gwqDCoMKgwqDC
oCBrZnJlZShiby0+bWV0YWRhdGEpOwo+PiDCoMKgwqDCoMKgIGtmcmVlKGJvKTsKPj4gwqAgfQo+
PiBAQCAtNjEzLDYgKzYxNywxMiBAQCBzdGF0aWMgaW50IGFtZGdwdV9ib19kb19jcmVhdGUoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCj4+IMKgwqDCoMKgwqAgaWYgKGJwLT50eXBlID09IHR0
bV9ib190eXBlX2RldmljZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGJvLT5mbGFncyAmPSB+QU1E
R1BVX0dFTV9DUkVBVEVfQ1BVX0FDQ0VTU19SRVFVSVJFRDsKPj4gwqAgK8KgwqDCoCBJTklUX0xJ
U1RfSEVBRCgmYm8tPmJvKTsKPj4gKwo+PiArwqDCoMKgIHNwaW5fbG9jaygmdHRtX2JvX2dsb2Iu
bHJ1X2xvY2spOwo+PiArwqDCoMKgIGxpc3RfYWRkX3RhaWwoJmJvLT5ibywgJmFkZXYtPmRldmlj
ZV9ib19saXN0KTsKPj4gK8KgwqDCoCBzcGluX3VubG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2sp
Owo+PiArCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIMKgIGZhaWxfdW5yZXNlcnZlOgo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5o
IAo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAo+PiBpbmRl
eCA5YWMzNzU2Li41YWU4NTU1IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X29iamVjdC5oCj4+IEBAIC0xMTAsNiArMTEwLDggQEAgc3RydWN0IGFtZGdwdV9ibyB7
Cj4+IMKgwqDCoMKgwqAgc3RydWN0IGxpc3RfaGVhZMKgwqDCoMKgwqDCoMKgIHNoYWRvd19saXN0
Owo+PiDCoCDCoMKgwqDCoMKgIHN0cnVjdCBrZ2RfbWVtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqa2ZkX2JvOwo+PiArCj4+ICvCoMKgwqAgc3RydWN0IGxpc3RfaGVhZMKgwqDC
oMKgwqDCoMKgIGJvOwo+PiDCoCB9Owo+PiDCoCDCoCBzdGF0aWMgaW5saW5lIHN0cnVjdCBhbWRn
cHVfYm8gKnR0bV90b19hbWRncHVfYm8oc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0IAo+PiAqdGJv
KQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNB
JTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGYW1kLWdm
eCZhbXA7ZGF0YT0wNCU3QzAxJTdDYW5kcmV5Lmdyb2R6b3Zza3klNDBhbWQuY29tJTdDMGM3MDNl
YjZlNzM3NDQ5NjJkM2IwOGQ4YmM1NmYzMDMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MwJTdDNjM3NDY2NDI4OTIzOTA1NjcyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNk
OGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pY
VkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPTJUa3o0RU1PRXdGTFFKVU9rMWl4ZDI4YzJhZDFI
cWpCVklETyUyRlgwT2dxTSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngK
