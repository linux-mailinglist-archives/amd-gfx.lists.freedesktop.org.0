Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF42B402B
	for <lists+amd-gfx@lfdr.de>; Mon, 16 Nov 2020 10:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFA089DAB;
	Mon, 16 Nov 2020 09:48:25 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690052.outbound.protection.outlook.com [40.107.69.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026A589D7C;
 Mon, 16 Nov 2020 09:48:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHmvCGuON7/+KPW8AThLX7AXUMMAPFHJlF5kXb5XP7ELCjhd0kcaXwgGBL0HE+IrZB3cBJh7JXWpoJbFn6oA5Fyk/+RBaTtitpm/qvlhrgyBs6N67NEg21PyF3CSpCCtuZtIDTd/VYlqID6b2qnb/x93XOM6sOkPxzw6gJwXTolAVldQR2BT/LJbHAAMh25hz3xWY53AxYiGnP+rFT9wzR2dEX57d1TtwEBEk8ky9/mKCi+uyMTLWTu5Rmn0EajGZKGJ1Y8nEr/+89N9m2qTPPE9WCAfBkcqURCSH5VY31lWe9teeMGAGThDN3JZssEs+FxD1nxdA7lpCVxOc/tFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3/SUdPq+jKnGq41zH/IUpR8XzfdUl/fF6jJ4scofdI=;
 b=eh2yOI0y2rqtELVlwhpV5G5TItnbxKDaUo2dQ2qjvePJsjISw387QYAZ2wbSw84osVzOKoswrAm+SIb5e4ajfcg3r6jPOGPSvR8s/3hQa4Rr77q/NzRqr11IfyIQKEzC9SByR2/CW4LJdfYzgkTUpDjEWh25x+Dy4+VQm2574DIAESNb/Tpgvnk/qusrSCAI4794GE/JhGRD9wuJGb72s3AFiwNTNqPTidtBBnWpFZ1oF42k8L0iBxy+14cqPVqmNZiWxGQxK/uoCeXXg1/pO7mgqvhtfTXteXocEfoA0X2afstzHzhZyfJNSJ8sLiRHwjYmGKsnlJquf0SIqIixCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3/SUdPq+jKnGq41zH/IUpR8XzfdUl/fF6jJ4scofdI=;
 b=eagREgaY+uv1/zNm03mhMSd7IQwc/T/QWEaVgckBr83bDXqAqb9Y4MuSxisHbqrMnfgUDSg12tqevVZEUaPFUZW9HsFSu55AB8EH160xA5pi6t+/WcgesVQjoTHR9i3iXjYU4wZIHFsT96iRxr5tGAjYUW7BZ23/wBeN/VZAkY4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Mon, 16 Nov
 2020 09:48:20 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 09:48:20 +0000
Subject: Re: [PATCH v2 1/8] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-2-git-send-email-andrey.grodzovsky@amd.com>
 <6809de08-2035-edda-ebd2-05e7f77a1068@gmail.com>
 <cda48298-1e0b-7cad-7979-6d5c2f99ef94@amd.com>
 <78fd1669-e39b-d407-b558-f9ac76e494e2@amd.com>
 <CAKMK7uHa386Reo4q99sLQDaQR6nh6dgGm3duOq135h+kC2dLjA@mail.gmail.com>
 <a13a7893-a3dd-c4f6-0a0f-0fce8c005e53@amd.com>
 <fefd0ae2-7776-0e57-cc97-805f6237c82f@gmail.com>
 <CAKMK7uGzbiA=XSgNVLsimYO668L7yH1pakO+5T5cFmibSD9zvQ@mail.gmail.com>
 <54e774a4-5ec3-29df-3c70-b5f94eaea6ac@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e048e4be-f380-2424-33e9-e82e64a33d4d@amd.com>
Date: Mon, 16 Nov 2020 10:48:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <54e774a4-5ec3-29df-3c70-b5f94eaea6ac@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19)
 To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM3PR04CA0135.eurprd04.prod.outlook.com (2603:10a6:207::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 09:48:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 847e3c06-37e9-4fdd-932f-08d88a14bfea
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4916E43440E3D648DDF379E083E30@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: emGAt9cmjlyAGSKWN5wFqMnKIq+cTsexFBqafqcsv7LDlV507f8OQ0e1HUAGwAfIlQcd2MfIn0sQOCyDq9FZbeKAfbfuEfFXJuaY/GcleZacxdQwT9S7kYyKNqccugp47ly5Z+s4NU6V15UcfMiFINkbpcTzU4IQIMwD9KGQG6XEyF4IaeNX34d10qKvC3pYz6gq83IjPA9/LPCCrAokHovlKD9zpepmgKVISfA80gwRRMM5Zr6OffhXOdTvmvy7jrUw7M/lyFK9Ec8lRwnrBlrfXwOm9QL3+CH6rQ4G66Y92C5jRASCbypOIaD7uBKpcdln7WSd6WALWzOM+Uim5aj9JCmT6xQ62p1JE5f3M7nq5x/mBBurC2wp1p76qvHh7P382pNiVRKKHd0SPwQ79mDjMSUUhFds3sCKDaLvPOtn+p0myIXjxJDXPzmIiDommdvB1nXfo5+5T5aSg61mng==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(6486002)(478600001)(4326008)(45080400002)(36756003)(2616005)(66946007)(66476007)(66556008)(16526019)(186003)(5660300002)(83380400001)(66574015)(2906002)(8676002)(31696002)(6666004)(54906003)(31686004)(86362001)(110136005)(53546011)(966005)(316002)(8936002)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dmloczRZUkFwWGVQZlRnSmx0blBxK1l4b01WNDNmekRYVnRremx6Uml3dG1S?=
 =?utf-8?B?YTJZYUtLRUVvYTdCc0UxTldCSExGbGRnbWpQWmNBS01qQXFUUG1ZV1V1TzJU?=
 =?utf-8?B?ZjV6aDVLZFlvZ1BzQWFxMW5kbGN2YXhVdzlsZXpZQ1AycnpBUldrKzNGd0R2?=
 =?utf-8?B?cjlKcjNrMVl3WnJDU1cwWTNPMjlkK1dlRTZNRjZzdEFCZ3BLTUJteDdJTTEr?=
 =?utf-8?B?S3BKR3hBRkljWlRaWERoWjM3NUZ3WWp2UUhVRG5TZ21XeVpmcVFXR0UyRCtj?=
 =?utf-8?B?d09OQ3AxaytQZzIyRkVXeStpZjZPS0dHM1RkMjhHVFBEUjFBUkc3bFBwSTZU?=
 =?utf-8?B?M1U5YWtmSVNnZkZZMXBRQUo0RnA0T1B5WFY3TWtESU5WdnFjamVQOXl2OU96?=
 =?utf-8?B?U0Fjd1BEMkFMUzFqUnhWUDdNUllqeXVVTE9XVFdtbDlEU2x3RHF6K3JIYks0?=
 =?utf-8?B?RURmbzk2TG8wMWlLcFhMazBLZHNtYlZGUVJpNFpuM0I3Wnp2bkZPcnZuWEU4?=
 =?utf-8?B?QmZkRlIrZkcyV0Q4R1BJVWMyZmhYcDBBSXJobUFjWldnSmoycDZ4QzR3MTFI?=
 =?utf-8?B?cHpyOHFLUVdKNzUzcjJXZVlhMFd0SExNdU9ISnk1UzY0MXpDaWh0OU1scGZE?=
 =?utf-8?B?ai9Sd29tZmg1Uk03cUpZU21zSEZGZndDQkVQaGJmdDdGZ3A5WUNjSC9zZ3pR?=
 =?utf-8?B?ckdOUmEyUHZ4NWtGQkZsY3FsSHg2Smdpd2pPbUN0bzdNZ3g3d0cyNFI1amVD?=
 =?utf-8?B?K2Jka21KRUlNZXJpM2phWUp1ZHpUZUVhRStSZFppbEdaUWNnQngvTUNWaWRS?=
 =?utf-8?B?MkRQajYyRFVLU3lFS3YzNXprd2xBZWtIMnU1YWxFSk1FcFVFaktmMGxxYWhy?=
 =?utf-8?B?T2hOREtoMnMvS254UXk1UFg2S0E3L042NHZhZkFhUGd0S2YzeEZIeVJ5bGxa?=
 =?utf-8?B?RDF3bnJ6dmkrOHR1VG0waWdaUU9oWGtiZ25aNkJXcCs4cHd5L0pRaFBpWXVB?=
 =?utf-8?B?dktEcEM4Y2gwMjNZK1dpSjhJZGV5WVR4ZEFFbEdPWUJFSUdmOHQ2YzZJM0Q2?=
 =?utf-8?B?VnFNMkl0WG5YZnVmNUJjbmZRZE1VbVRIT1hKT0NhejN2MHQyYk9KR2JuTHFC?=
 =?utf-8?B?ZkdkRFI2YnNBUmNLUjJQdDR5ZW5JbVlneHkvc29JUEZ1RmxqUnBoNU9UWlFv?=
 =?utf-8?B?Vy9vcEMzdU1vY0hvaTl4azZHcDRIeEx3aWkzblZhOHdqVVk1cUdqMnRUTmxl?=
 =?utf-8?B?TVZoNkNraEZFMENONDgxbHlMRlJiNzNWV0hOb0I0UUpmQkRWUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 847e3c06-37e9-4fdd-932f-08d88a14bfea
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 09:48:20.1123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDeO6OJeBj0r9Sh77i5ECzSczPWwl6GhFE7Dmt2U7m3fTHZs+haXH4SYCDLQMp6r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTUuMTEuMjAgdW0gMDc6MzQgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzE0LzIwIDQ6NTEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFNhdCwgTm92IDE0LCAy
MDIwIGF0IDk6NDEgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gQW0gMTMuMTEuMjAgdW0gMjE6NTIgc2NocmllYiBBbmRy
ZXkgR3JvZHpvdnNreToKPj4+PiBPbiA2LzIyLzIwIDE6NTAgUE0sIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4+Pj4+IE9uIE1vbiwgSnVuIDIyLCAyMDIwIGF0IDc6NDUgUE0gQ2hyaXN0aWFuIEvDtm5p
Zwo+Pj4+PiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPj4+Pj4+IEFtIDIyLjA2
LjIwIHVtIDE2OjMyIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4gT24gNi8yMi8y
MCA5OjE4IEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+PiBBbSAyMS4wNi4yMCB1
bSAwODowMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4gV2lsbCBiZSB1c2Vk
IHRvIHJlcm91dGUgQ1BVIG1hcHBlZCBCTydzIHBhZ2UgZmF1bHRzIG9uY2UKPj4+Pj4+Pj4+IGRl
dmljZSBpcyByZW1vdmVkLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBHcm9kem92c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgo+Pj4+Pj4+Pj4gLS0tCj4+
Pj4+Pj4+PiDCoMKgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmPCoCB8wqAgOCArKysrKysr
Kwo+Pj4+Pj4+Pj4gwqDCoMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYyB8IDEwICsrKysr
KysrKysKPj4+Pj4+Pj4+IMKgwqDCoCBpbmNsdWRlL2RybS9kcm1fZmlsZS5owqDCoMKgwqDCoCB8
wqAgMiArKwo+Pj4+Pj4+Pj4gwqDCoMKgIGluY2x1ZGUvZHJtL2RybV9nZW0uaMKgwqDCoMKgwqDC
oCB8wqAgMiArKwo+Pj4+Pj4+Pj4gwqDCoMKgIDQgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKQo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZpbGUuYyAKPj4+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxlLmMKPj4+Pj4+Pj4+
IGluZGV4IGM0YzcwNGUuLjY3YzA3NzAgMTAwNjQ0Cj4+Pj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZpbGUuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9maWxl
LmMKPj4+Pj4+Pj4+IEBAIC0xODgsNiArMTg4LDEyIEBAIHN0cnVjdCBkcm1fZmlsZSAqZHJtX2Zp
bGVfYWxsb2Moc3RydWN0Cj4+Pj4+Pj4+PiBkcm1fbWlub3IgKm1pbm9yKQo+Pj4+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X3ByaW1lX2Rlc3Ryb3k7Cj4+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Pj4+PiDCoMKgwqAgK8KgwqDCoCBmaWxlLT5kdW1t
eV9wYWdlID0gYWxsb2NfcGFnZShHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7Cj4+Pj4+Pj4+PiAr
wqDCoMKgIGlmICghZmlsZS0+ZHVtbXlfcGFnZSkgewo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldCA9IC1FTk9NRU07Cj4+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfcHJpbWVf
ZGVzdHJveTsKPj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIGZpbGU7Cj4+Pj4+Pj4+PiDCoMKgwqDCoMKgIG91dF9wcmltZV9kZXN0
cm95Ogo+Pj4+Pj4+Pj4gQEAgLTI4NCw2ICsyOTAsOCBAQCB2b2lkIGRybV9maWxlX2ZyZWUoc3Ry
dWN0IGRybV9maWxlICpmaWxlKQo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKGRldi0+ZHJp
dmVyLT5wb3N0Y2xvc2UpCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldi0+ZHJp
dmVyLT5wb3N0Y2xvc2UoZGV2LCBmaWxlKTsKPj4+Pj4+Pj4+IMKgwqDCoCArwqDCoMKgIF9fZnJl
ZV9wYWdlKGZpbGUtPmR1bW15X3BhZ2UpOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gZHJtX3ByaW1l
X2Rlc3Ryb3lfZmlsZV9wcml2YXRlKCZmaWxlLT5wcmltZSk7Cj4+Pj4+Pj4+PiBXQVJOX09OKCFs
aXN0X2VtcHR5KCZmaWxlLT5ldmVudF9saXN0KSk7Cj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9wcmltZS5jCj4+Pj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYwo+Pj4+Pj4+Pj4gaW5kZXggMWRlMmNkZS4uYzQ4MmU5YyAxMDA2NDQKPj4+Pj4+Pj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbWUuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9wcmltZS5jCj4+Pj4+Pj4+PiBAQCAtMzM1LDYgKzMzNSwxMyBAQCBpbnQg
ZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUoc3RydWN0Cj4+Pj4+Pj4+PiBkcm1fZGV2aWNlICpk
ZXYsCj4+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZHJtX3ByaW1lX2FkZF9idWZf
aGFuZGxlKCZmaWxlX3ByaXYtPnByaW1lLAo+Pj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGRtYV9idWYsICpoYW5kbGUpOwo+Pj4+Pj4+Pj4gKwo+Pj4+Pj4+Pj4gK8KgwqDC
oCBpZiAoIXJldCkgewo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIG9iai0+ZHVtbXlfcGFnZSA9
IGFsbG9jX3BhZ2UoR0ZQX0tFUk5FTCB8IF9fR0ZQX1pFUk8pOwo+Pj4+Pj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGlmICghb2JqLT5kdW1teV9wYWdlKQo+Pj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0ID0gLUVOT01FTTsKPj4+Pj4+Pj4+ICvCoMKgwqAgfQo+Pj4+Pj4+Pj4gKwo+Pj4+
Pj4+PiBXaGlsZSB0aGUgcGVyIGZpbGUgY2FzZSBzdGlsbCBsb29rcyBhY2NlcHRhYmxlIHRoaXMg
aXMgYSBjbGVhciBOQUsKPj4+Pj4+Pj4gc2luY2UgaXQgd2lsbCBtYXNzaXZlbHkgaW5jcmVhc2Ug
dGhlIG1lbW9yeSBuZWVkZWQgZm9yIGEgcHJpbWUKPj4+Pj4+Pj4gZXhwb3J0ZWQgb2JqZWN0Lgo+
Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIHRoaW5rIHRoYXQgdGhpcyBpcyBxdWl0ZSBvdmVya2lsbCBpbiB0
aGUgZmlyc3QgcGxhY2UgYW5kIGZvciB0aGUKPj4+Pj4+Pj4gaG90IHVucGx1ZyBjYXNlIHdlIGNh
biBqdXN0IHVzZSB0aGUgZ2xvYmFsIGR1bW15IHBhZ2UgYXMgd2VsbC4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+IEdsb2JhbCBkdW1teSBwYWdlIGlzIGdvb2QgZm9yIHJlYWQg
YWNjZXNzLCB3aGF0IGRvIHlvdSBkbyBvbiB3cml0ZQo+Pj4+Pj4+IGFjY2VzcyA/IE15IGZpcnN0
IGFwcHJvYWNoIHdhcyBpbmRlZWQgdG8gbWFwIGF0IGZpcnN0IGdsb2JhbCBkdW1teQo+Pj4+Pj4+
IHBhZ2UgYXMgcmVhZCBvbmx5IGFuZCBtYXJrIHRoZSB2bWEtPnZtX2ZsYWdzIGFzICFWTV9TSEFS
RUQgYXNzdW1pbmcKPj4+Pj4+PiB0aGF0IHRoaXMgd291bGQgdHJpZ2dlciBDb3B5IE9uIFdyaXRl
IGZsb3cgaW4gY29yZSBtbQo+Pj4+Pj4+IChodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0
aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZlbGl4aXIuYm9vdGxpbi5jb20lMkZs
aW51eCUyRnY1LjctcmM3JTJGc291cmNlJTJGbW0lMkZtZW1vcnkuYyUyM0wzOTc3JmFtcDtkYXRh
PTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0MwMDA1M2U5ZDk4MzA0MWVk
NjNhZTA4ZDg4ODgyZWQ4NyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc0MDk0NDMyMjQwMTYzNzclN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9a2doaUczVnBDSm9kNlllZkV4b0RWUGw5WDAzek5odzNTTjVHQXhn
Ym5tVSUzRCZhbXA7cmVzZXJ2ZWQ9MCkgCj4+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+IG9uIHRoZSBu
ZXh0IHBhZ2UgZmF1bHQgdG8gc2FtZSBhZGRyZXNzIHRyaWdnZXJlZCBieSBhIHdyaXRlIAo+Pj4+
Pj4+IGFjY2VzcyBidXQKPj4+Pj4+PiB0aGVuIGkgcmVhbGl6ZWQgYSBuZXcgQ09XIHBhZ2Ugd2ls
bCBiZSBhbGxvY2F0ZWQgZm9yIGVhY2ggc3VjaCAKPj4+Pj4+PiBtYXBwaW5nCj4+Pj4+Pj4gYW5k
IHRoaXMgaXMgbXVjaCBtb3JlIHdhc3RlZnVsIHRoZW4gaGF2aW5nIGEgZGVkaWNhdGVkIHBhZ2Ug
cGVyIEdFTQo+Pj4+Pj4+IG9iamVjdC4KPj4+Pj4+IFllYWgsIGJ1dCB0aGlzIGlzIG9ubHkgZm9y
IGEgdmVyeSB2ZXJ5IHNtYWxsIGNvcm5lciBjYXNlcy4gV2hhdCAKPj4+Pj4+IHdlIG5lZWQKPj4+
Pj4+IHRvIHByZXZlbnQgaXMgaW5jcmVhc2luZyB0aGUgbWVtb3J5IHVzYWdlIGR1cmluZyBub3Jt
YWwgb3BlcmF0aW9uIHRvCj4+Pj4+PiBtdWNoLgo+Pj4+Pj4KPj4+Pj4+IFVzaW5nIG1lbW9yeSBk
dXJpbmcgdGhlIHVucGx1ZyBpcyBjb21wbGV0ZWx5IHVucHJvYmxlbWF0aWMgCj4+Pj4+PiBiZWNh
dXNlIHdlCj4+Pj4+PiBqdXN0IHJlbGVhc2VkIHF1aXRlIGEgYnVuY2ggb2YgaXQgYnkgcmVsZWFz
aW5nIGFsbCB0aG9zZSBzeXN0ZW0gCj4+Pj4+PiBtZW1vcnkKPj4+Pj4+IGJ1ZmZlcnMuCj4+Pj4+
Pgo+Pj4+Pj4gQW5kIEknbSBwcmV0dHkgc3VyZSB0aGF0IENPV2VkIHBhZ2VzIGFyZSBjb3JyZWN0
bHkgYWNjb3VudGVkIHRvd2FyZHMKPj4+Pj4+IHRoZQo+Pj4+Pj4gdXNlZCBtZW1vcnkgb2YgYSBw
cm9jZXNzLgo+Pj4+Pj4KPj4+Pj4+IFNvIEkgdGhpbmsgaWYgdGhhdCBhcHByb2FjaCB3b3JrcyBh
cyBpbnRlbmRlZCBhbmQgdGhlIENPVyBwYWdlcyBhcmUKPj4+Pj4+IHJlbGVhc2VkIGFnYWluIG9u
IHVubWFwcGluZyBpdCB3b3VsZCBiZSB0aGUgcGVyZmVjdCBzb2x1dGlvbiB0byB0aGUKPj4+Pj4+
IHByb2JsZW0uCj4+Pj4+Pgo+Pj4+Pj4gRGFuaWVsIHdoYXQgZG8geW91IHRoaW5rPwo+Pj4+PiBJ
ZiBDT1cgd29ya3MsIHN1cmUgc291bmRzIHJlYXNvbmFibGUuIEFuZCBpZiB3ZSBjYW4gbWFrZSBz
dXJlIHdlCj4+Pj4+IG1hbmFnZWQgdG8gZHJvcCBhbGwgdGhlIHN5c3RlbSBhbGxvY2F0aW9ucyAo
b3RoZXJ3aXNlIHN1ZGRlbmx5IDJ4Cj4+Pj4+IG1lbW9yeSB1c2FnZSwgd29yc3QgY2FzZSkuIEJ1
dCBJIGhhdmUgbm8gaWRlYSB3aGV0aGVyIHdlIGNhbgo+Pj4+PiByZXRyb3Nob2Vob3JuIHRoYXQg
aW50byBhbiBlc3RhYmxpc2hlZCB2bWEsIHlvdSBtaWdodCBoYXZlIGZ1biBzdHVmZgo+Pj4+PiBs
aWtlIGEgbWt3cml0ZSBoYW5kbGVyIHRoZXJlICh3aGljaCBJIHRob3VnaHQgaXMgdGhlIENPVyBo
YW5kbGVyCj4+Pj4+IHRoaW5nLCBidXQgcmVhbGx5IG5vIGlkZWEpLgo+Pj4+Pgo+Pj4+PiBJZiB3
ZSBuZWVkIHRvIG1hc3NpdmVseSBjaGFuZ2Ugc3R1ZmYgdGhlbiBJIHRoaW5rIHJ3IGR1bW15IHBh
Z2UsCj4+Pj4+IGFsbG9jYXRlZCBvbiBmaXJzdCBmYXVsdCBhZnRlciBob3R1bnBsdWcgKG1heWJl
IGp1c3QgbWFrZSBpdCBvbmUgcGVyCj4+Pj4+IG9iamVjdCwgdGhhdCdzIHNpbXBsZXN0KSBzZWVt
cyBsaWtlIHRoZSBtdWNoIHNhZmVyIG9wdGlvbi4gTXVjaCBsZXNzCj4+Pj4+IGNvZGUgdGhhdCBj
YW4gZ28gd3JvbmcuCj4+Pj4+IC1EYW5pZWwKPj4+Pgo+Pj4+IFJlZ2FyZGluZyBDT1csIGkgd2Fz
IGxvb2tpbmcgaW50byBob3cgdG8gcHJvcGVybHkgaW1wbGVtZW50IGl0IGZyb20KPj4+PiB3aXRo
aW4gdGhlIGZhdWx0IGhhbmRsZXIgKGkuZS4gdHRtX2JvX3ZtX2ZhdWx0KQo+Pj4+IGFuZCB0aGUg
bWFpbiBvYnN0YWNsZSBJIGhpdCBpcyB0aGF0IG9mIGV4Y2x1c2l2ZSBhY2Nlc3MgdG8gdGhlCj4+
Pj4gdm1fYXJlYV9zdHJ1Y3QsIGkgbmVlZCB0byBiZSBhYmxlIHRvIG1vZGlmeQo+Pj4+IHZtYS0+
dm1fZmxhZ3MgKGFuZCB2bV9wYWdlX3Byb3QpwqAgdG8gcmVtb3ZlIFZNX1NIQVJFRCBiaXQgc28g
Q09XIGNhbgo+Pj4+IGJlIHRyaWdnZXJlZCBvbiBzdWJzZXF1ZW50IHdyaXRlIGFjY2Vzcwo+Pj4+
IGZhdWx0IChoZXJlCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGZWxpeGlyLmJvb3RsaW4uY29tJTJGbGludXglMkZs
YXRlc3QlMkZzb3VyY2UlMkZtbSUyRm1lbW9yeS5jJTIzTDQxMjgmYW1wO2RhdGE9MDQlN0MwMSU3
Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1kLmNvbSU3QzAwMDUzZTlkOTgzMDQxZWQ2M2FlMDhkODg4
ODJlZDg3JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQw
OTQ0MzIyNDAxNjM3NyU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURB
aUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFt
cDtzZGF0YT16aUhKdHF5SHVMcmxiMHVZS2hvV0NXaFVBWm5YMEpxdUUlMkJrQko1RnglMkJObyUz
RCZhbXA7cmVzZXJ2ZWQ9MCkgCj4+Pj4KPj4+PiBidXQgY29yZSBtbSB0YWtlcyBvbmx5IHJlYWQg
c2lkZSBtbV9zZW0gKGhlcmUgZm9yIGV4YW1wbGUKPj4+PiBodHRwczovL25hbTExLnNhZmVsaW5r
cy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZlbGl4aXIuYm9vdGxp
bi5jb20lMkZsaW51eCUyRmxhdGVzdCUyRnNvdXJjZSUyRmRyaXZlcnMlMkZpb21tdSUyRmFtZCUy
RmlvbW11X3YyLmMlMjNMNDg4JmFtcDtkYXRhPTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0
MGFtZC5jb20lN0MwMDA1M2U5ZDk4MzA0MWVkNjNhZTA4ZDg4ODgyZWQ4NyU3QzNkZDg5NjFmZTQ4
ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzc0MDk0NDMyMjQwMTYzNzclN0NVbmtu
b3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENK
QlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMTAwMCZhbXA7c2RhdGE9aDM2MGM3NVVwbDMl
MkZXN2ltN00xJTJCeFklMkZYeTRneGluJTJCa0NGMVVpMnpGWE1zJTNEJmFtcDtyZXNlcnZlZD0w
KSAKPj4+Pgo+Pj4+IGFuZCBzbyBJIGFtIG5vdCBzdXBwb3NlZCB0byBtb2RpZnkgdm1fYXJlYV9z
dHJ1Y3QgaW4gdGhpcyBjYXNlLiBJIGFtCj4+Pj4gbm90IHN1cmUgaWYgaXQncyBsZWdpdCB0byB3
cml0ZSBsb2NrIHR0aGUgbW1fc2VtIGZyb20gdGhpcyBwb2ludC4KPj4+PiBJIGZvdW5kIHNvbWUg
ZGlzY3Vzc2lvbnMgYWJvdXQgdGhpcyBoZXJlCj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHAlM0ElMkYlMkZsa21sLml1LmVkdSUyRmh5
cGVybWFpbCUyRmxpbnV4JTJGa2VybmVsJTJGMTkwOS4xJTJGMDI3NTQuaHRtbCZhbXA7ZGF0YT0w
NCU3QzAxJTdDQW5kcmV5Lkdyb2R6b3Zza3klNDBhbWQuY29tJTdDMDAwNTNlOWQ5ODMwNDFlZDYz
YWUwOGQ4ODg4MmVkODclN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0Mw
JTdDNjM3NDA5NDQzMjI0MDIxMzc5JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0
d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3
QzEwMDAmYW1wO3NkYXRhPXN4NnMxbEglMkZ2eGJJWmFqYzRZcjQ5dkZoeHZQRW5CSFpsVHQ1MkQ4
cXZaQSUzRCZhbXA7cmVzZXJ2ZWQ9MCAKPj4+PiBidXQgaXQKPj4+PiB3YXNuJ3QgcmVhbGx5IGNs
ZWFyIHRvIG1lCj4+Pj4gd2hhdCdzIHRoZSBzb2x1dGlvbi4KPj4+Pgo+Pj4+IEluIGFueSBjYXNl
LCBzZWVtcyB0byBtZSB0aGF0IGVhc2llciBhbmQgbW9yZSBtZW1vcnkgc2F2aW5nIHNvbHV0aW9u
Cj4+Pj4gd291bGQgYmUgdG8ganVzdCBzd2l0Y2ggdG8gcGVyIHR0bSBibyBkdW15IHJ3IHBhZ2Ug
dGhhdAo+Pj4+IHdvdWxkIGJlIGFsbG9jYXRlZCBvbiBkZW1hbmQgYXMgeW91IHN1Z2dlc3RlZCBo
ZXJlLsKgIFRoaXMgc2hvdWxkIGFsc28KPj4+PiB0YWtlIGNhcmUgb2YgaW1wb3J0ZWQgQk9zIGFu
ZCBmbGluayBjYXNlcy4KPj4+PiBUaGVuIGkgY2FuIGRyb3AgdGhlIHBlciBkZXZpY2UgRkQgYW5k
IHBlciBHRU0gb2JqZWN0IEZEIGR1bW15IEJPIGFuZAo+Pj4+IHRoZSB1Z2x5IGxvb3AgaSBhbSB1
c2luZyBpbiBwYXRjaCAyIHRvIG1hdGNoIGZhdWx0aW5nIEJPIHRvIHRoZSByaWdodAo+Pj4+IGR1
bW15IHBhZ2UuCj4+Pj4KPj4+PiBEb2VzIHRoaXMgbWFrZXMgc2Vuc2UgPwo+Pj4gSSBzdGlsbCBk
b24ndCBzZWUgdGhlIGluZm9ybWF0aW9uIGxlYWsgYXMgbXVjaCBvZiBhIHByb2JsZW0sIGJ1dCBp
Zgo+Pj4gRGFuaWVsIGluc2lzdHMgd2Ugc2hvdWxkIHByb2JhYmx5IGRvIHRoaXMuCj4+IFdlbGwg
YW1kZ3B1IGRvZXNuJ3QgY2xlYXIgYnVmZmVycyBieSBkZWZhdWx0LCBzbyBpbmRlZWQgeW91IGd1
eXMgYXJlIGEKPj4gbG90IG1vcmUgbGFpc3Nlei1mYWlyZSBoZXJlLiBCdXQgaW4gZ2VuZXJhbCB3
ZSByZWFsbHkgZG9uJ3QgZG8gdGhhdAo+PiBraW5kIG9mIGxlYWtpbmcuIElpcmMgdGhlcmUncyBl
dmVuIHJhZGVvbnNpIGJ1Z3MgYmVjYXVzZSBlbHNlIGNsZWFycywKPj4gYW5kIHJhZGVvbnNpIGhh
cHBpbHkgZGlzcGxheXMgZ3VuayA6LSkKPj4KPj4+IEJ1dCBjb3VsZCB3ZSBhdCBsZWFzdCBoYXZl
IG9ubHkgb25lIHBhZ2UgcGVyIGNsaWVudCBpbnN0ZWFkIG9mIHBlciBCTz8KPj4gSSB0aGluayB5
b3UgY2FuIGRvIG9uZSBwYWdlIHBlciBmaWxlIGRlc2NyaXB0b3Igb3Igc29tZXRoaW5nIGxpa2UK
Pj4gdGhhdC4gQnV0IGdldHMgYW5ub3lpbmcgd2l0aCBzaGFyZWQgYm8sIGVzcGVjaWFsbHkgd2l0
aCBkbWFfYnVmX21tYXAKPj4gZm9yd2FyZGluZy4KPj4gLURhbmllbAo+Cj4KPiBDaHJpc3RpYW4g
LSBpcyB5b3VyIGNvbmNlcm4gbW9yZSB3aXRoIHRvbyBtdWNoIHBhZ2UgYWxsb2NhdGlvbnMgb3Ig
Cj4gd2l0aCBleHRyYSBwb2ludGVyIG1lbWJlcgo+IGNsdXR0ZXJpbmcgVFRNIEJPIHN0cnVjdCA/
CgpZZXMsIHRoYXQgaXMgb25lIHByb2JsZW0uCgo+IEJlY2F1c2Ugd2UgY2FuIGFsbG9jYXRlIHRo
ZSBkdW1teSBwYWdlIG9uIGRlbWFuZCBvbmx5IHdoZW4KPiBuZWVkZWQuIEl0J3MganVzdCBzZWVt
cyB0byBtZSB0aGF0IGtlZXBpbmcgaXQgcGVyIEJPIHN0cmVhbWxpbmVzIHRoZSAKPiBjb2RlIGFz
IEkgZG9uJ3QgbmVlZCB0bwo+IGhhdmUgZGlmZmVyZW50IGhhbmRsaW5nIGZvciBsb2NhbCB2cyBp
bXBvcnRlZCBCT3MuCgpXaHkgc2hvdWxkIHlvdSBoYXZlIGEgZGlmZmVyZW5jZSBiZXR3ZWVuIGxv
Y2FsIHZzIGltcG9ydGVkIEJPcz8KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0
CmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
