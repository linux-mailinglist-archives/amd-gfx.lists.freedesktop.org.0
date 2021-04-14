Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF2B35F7CB
	for <lists+amd-gfx@lfdr.de>; Wed, 14 Apr 2021 17:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49DEB6E953;
	Wed, 14 Apr 2021 15:47:20 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9826E953;
 Wed, 14 Apr 2021 15:47:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzc3a+wp/MwKHzZ5XG/gcagFdCs9lz2uKzfrAWYAuZV6guS3hrhS+e6xZ4B+LH1ppJBnOJHJPFpSOJsVcG2saN4T43furFYE0eZOrP2ZVPfdJWF+cl5Yy+F1++ZbCnwXZ2nlks/ERZhJnTMD4VuanhGwInSA0EI2+oFC69ROai1r+qHTvSGmqWEfDYQm9cDMs5o/XLuZzhQ7BRXfz29g+lmw/pxSKNtrd/PYzLiV+8MpUMlH/L3wn++VuUspdiL9XejSUEHRohpBY5cG0oC2Qc5Sd1jlLzti7U0CyIeQKqAYiCb9Gnwgl0nf4STUlSVhCm42jkRzTH9dRYpqAgWQTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/8uwIKTbc5rsNw6HVOOtijpT37ZjbsnvVipVnl+33g=;
 b=g/QMORqPwz4YCY4ZC45rahz3LDgIu3Xs4LBkt6pk0XcJ/msJ74YfCwaNMv+1Bm3prQ4s960Qj+43YR5R5bv69xn7hjTiL5pZ+QH+uGlWo9fmoFiIo6QDNHQVEu+ypnjnjrmRD2JZAGMEOgz+tpPEQ7jutS4X2wUpomh5qqiKm8qqQif4g5fx21rYM8B7DZcSSDAw9ERAgXmevOEDK/6yBybwc7dgt80YneZrWU5wnbI7VLNnczNXAHGgf0z4NzDb9OnI7cAzj9CTNqcnfLiD93PBt2Ak9dLgb6+AC/tW6g7cLrgkF/rxX8//IlrQQf9VuL5e1Rd/qxafOzE0TYx8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/8uwIKTbc5rsNw6HVOOtijpT37ZjbsnvVipVnl+33g=;
 b=xu2xRzqesauGl3vFis8ZHWtXhCk2WsQYJlxzmkuoPeFrht2YqAxiCs+sVwfrsamlcsqR5Rw6pU9pXLBTcwDWi5TN6ePRMxbXVNNQJpb1hBpD0FkMbrSbP/Ny/nzU1pBjVI0OxZ45YtTB0QRSipYeyVX/cMF1i26lzUvrBeVMAPo=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3966.namprd12.prod.outlook.com (2603:10b6:208:165::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 15:47:16 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 15:47:16 +0000
Subject: Re: [PATCH 2/4] drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
To: philip yang <yangp@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
 <20210407231259.1787-2-Felix.Kuehling@amd.com>
 <3813f130-a255-0d63-3b40-60919a1ba8f8@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <fc3cad63-088b-449e-d3e8-19d60fb4fb8c@amd.com>
Date: Wed, 14 Apr 2021 11:47:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <3813f130-a255-0d63-3b40-60919a1ba8f8@amd.com>
Content-Language: en-US
X-Originating-IP: [142.182.180.233]
X-ClientProxiedBy: YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::15) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.180.233) by
 YTXPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21 via Frontend Transport; Wed, 14 Apr 2021 15:47:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8f3199-59c4-4184-e9bd-08d8ff5c93f8
X-MS-TrafficTypeDiagnostic: MN2PR12MB3966:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3966F165FD80DD83CB6E7488924E9@MN2PR12MB3966.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQMq0WlhECr1envrrPXjpq7hV/0Q7+FbRO6TN8xl8GEuC/o7apKYde2BxZww/yZ8lwnh+PpUsm96UUwLltsXyqWT0pzD12kvFUyk1qgGD5Gd1E/APEh4rxOpx27JZyhALyhQvwJP1+ubwPVHxAobPsxO8sNcHzKDoV6IMlb5f1ortqN/RyAMJXqWhlOYc/pE6pYGIzFthXkrDmAcrDHcpJc7HtucRkT+I9aVAi0JiolmPYgiLahfM6HtavPWWDgSyqI8JqHQbyLTHQRAj/fQbUylsD7d4DjnP2SJMehvuYKm5vd3ztET1NiqymLz8YdKC0P4hnKdbE2IWqHRbCMODE1wTv2a3e1wNsGo4FICq7mlOVJCFT5Picoj4P11XuY0YA3xmyvVBKwo2S7bRBI6Rr+4maFcl1pWS+lhnRjjdPmjQe9YEKoolCzOypIdWgxNKiEeOqG5HiS28o6eCOOUqkAqDGqA7HJLmcFm3LLjKvNuXcPEtCC2IH0vSunN9J2zqtnb6FsBm0ou7CnTBC5OwViBEz8ikMIla5nTI5DppmIFkInAVesEsU5+IJR87US3/EIyxyDzsThe6c2lYtVwxQ6XjwNxzfoNwiFNq5oxAIEB64zxl3tYRirvUGZaDAUDjvu/w8uMao5ELI/NAknLHVEzXVDpXD6IEOkGAKq750+6lC49bsUHSXnToP9zb6sd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(8936002)(8676002)(26005)(186003)(16526019)(2906002)(478600001)(31696002)(30864003)(83380400001)(6486002)(86362001)(36756003)(956004)(66946007)(4326008)(38100700002)(31686004)(66476007)(66556008)(316002)(5660300002)(16576012)(53546011)(44832011)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YUNWUHk3bmsrV0ZTQjkwR29NL3dGQldJQTdDT09nNVdZY3NiRGtaQzZmdldQ?=
 =?utf-8?B?VFVBM2ZWcit1TUFEOFlhRSs5QnY5MFhYRlJyM3QzTDVkYmJVbHVraWowcHFZ?=
 =?utf-8?B?NDhlVmJvOEwvS1JZaS81ajhndndVcG1qY0RJLzFWUEdOUWd0OUV3WlpsY2Y5?=
 =?utf-8?B?ZW1QSUxISmpRb2N3bTNEQmtXcmtLZFllVE4yTlRVM2dXQm83N0VuL1EyTjNu?=
 =?utf-8?B?cUtOOTFOVENJcGhDRlVpVmdPOFBTNDlwajJ5bk5vUlgzQVJ1dXRnWjhBVDJn?=
 =?utf-8?B?aUUyUTlvajg3K01UdTk3Tnl6TENlOGt6WENNeFVLWU8wMlhwQmhmT3gzcnp1?=
 =?utf-8?B?dXpBNWE5TXRqMWJzV2VKU3lsL2ZsdXVOMkFQVXI2c2lUcklyRnFHOHNnbGJZ?=
 =?utf-8?B?Mk5ncTdoWDB1NUlYTXBnb1cxVkYvQjUrZVNEQVRUeFlTbElxdWZhV0l0YVJ4?=
 =?utf-8?B?L21pVmcxenVEbm5jVGo1RWhBb0lnSCswSEMvRUVZTWQ2NFJxMXR4SEJXK1Z1?=
 =?utf-8?B?UXNzenlET1RyWDVHeU5RV1NsMGlwVm9uN2IzOVVvc2dkd1IyNngwNVJYdi9N?=
 =?utf-8?B?S3VzN015WWRhcXVaT0ZuSFZia0ltdEZHN0JxWmY2UzVWMW5zckxwVjkwZ3VN?=
 =?utf-8?B?VytuN29OZEpZc1l5RExTc1AvZ2dFVlNCWlZhck9wTUdNM0NuYnRKZ1dvWXRh?=
 =?utf-8?B?emFvNjRGVTNvb3psVWgzZ3VvYm1GODJ6QnBsT1ZKdFhIR1hDcHhESm9ieldN?=
 =?utf-8?B?YXZHL2JvalJIRlVxZnVWUk96eUFBZzl5b0IydDFrcWsyNTBGVnZNR0xIcUpt?=
 =?utf-8?B?QnJCalE4R0tPQVlxcTA5ZnZqS0pWbEpqNWtScU5YaGJlQmVOWEV2alhlZ2RT?=
 =?utf-8?B?QjFlME5OaWQ1Zm9pdWJYbFg4MkZpRHhEMU5EeW93ZU83K2h1eU5rQ3U0YTlP?=
 =?utf-8?B?azNSRDhDNWlCZWFYbnVIMTkvb0xTSCt4OWpXM3cwdkhZY1dCMjVsb1N2Q2F2?=
 =?utf-8?B?NHVsTEEyWTl0WHpFbGRRT0FVOWRWWHpGalM2dUNueGtqSFJyUGdOeHpEblF1?=
 =?utf-8?B?OGdFY1dub1NmdDFBSEtxOTJwZmd3Vzdyc0pWRmhIZUl3NHF4NnZYU3ZsbTVC?=
 =?utf-8?B?dHM5QU1LY25TdDBneWNhdjNVb3M3Q2pQUHFydEl2SXdOb2dvbDByM0pCZW0w?=
 =?utf-8?B?WnV1UmxBV3BwenlTekNJcm1ya3NXLy9EdTFBY0Y5NFBrWHVxNVgxd2tHeFhD?=
 =?utf-8?B?NjhyNmdQTFFuRllKb0RXUlhtV3hqZlUvZmFuNkR0bUljNm9CNkNqV0sza3VD?=
 =?utf-8?B?ZkRMWC9HNk4zakZudythNHRsSXZ5UkJkV2FTbENCRjR2dmlEdWFYYk12SEhw?=
 =?utf-8?B?SjJqZ3c4eE5oMTVtdnhlbEMxSlIvdmE5ejVaMUpVRm4wSmlxc05Yd3l5UmV1?=
 =?utf-8?B?bVVaTWwyK0ZOZTJUajNiQ0ZqckxBZ1NmdVZjRHc2ck45RU82Q2NDZDhtYTBa?=
 =?utf-8?B?WGN5bjNOcTRCMFpRbTFDQm9OQmRneElGWUFxbGdCN2FBWDJkMXNVZVg2U1Na?=
 =?utf-8?B?ZVBKZW4yV3BFMk91am1ka1BFdGdCQUhUYkttdTFkVFBZUmxsZEcwYVp5V29N?=
 =?utf-8?B?dHRPNm40MWhGejVhZTlGcXdockx6VW5WYmhVUW5QNnFQRFZQN0xJYzI0N2FD?=
 =?utf-8?B?WWthMVFnZmhwd3doMHI5V3hvKzh1NkRuT1hhcHRsNUo4akU3Zy9QTWQyY0RQ?=
 =?utf-8?B?c292Ujh6UkkzWE91NGZXWTZrWFFrTlpEZTAzT0NpSXJGbkFIcVh3NlJSVUk2?=
 =?utf-8?B?Z2N3WXBUQnhxc2o4eDk1UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8f3199-59c4-4184-e9bd-08d8ff5c93f8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:47:16.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: afWoYI+qROx4BiSqMpQmT1JdgYq0X34wSZdInwsjiU2D3AsIz3rBHohEHrYVJwyr+Dad0Acn04noYzAGlW5OnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3966
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0xNCB1bSAxMToyMSBhLm0uIHNjaHJpZWIgcGhpbGlwIHlhbmc6Cj4KPgo+IE9u
IDIwMjEtMDQtMDcgNzoxMiBwLm0uLCBGZWxpeCBLdWVobGluZyB3cm90ZToKPj4gYW1kZ3B1X2Ft
ZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1IG5lZWRzIHRoZSBkcm1fcHJpdiB0byBhbGxv
dyBtbWFwCj4+IHRvIGFjY2VzcyB0aGUgQk8gdGhyb3VnaCB0aGUgY29ycmVzcG9uZGluZyBmaWxl
IGRlc2NyaXB0b3IuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5L
dWVobGluZ0BhbWQuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9hbWRrZmQuaCAgICB8IDE0ICsrLS0KPj4gIC4uLi9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZF9ncHV2bS5jICB8IDY5ICsrKysrKysrKysrLS0tLS0tLS0KPj4gIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMgICAgICB8ICA1ICstCj4+ICAzIGZpbGVz
IGNoYW5nZWQsIDUwIGluc2VydGlvbnMoKyksIDM4IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZC5oCj4+IGluZGV4IDVmZmIwN2IwMjgx
MC4uMGQ1OWJlYmQ5MmFmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkLmgKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2FtZGtmZC5oCj4+IEBAIC0yMzYsMjAgKzIzNiwyMCBAQCB1aW50OF90IGFtZGdwdV9hbWRr
ZmRfZ2V0X3hnbWlfaG9wc19jb3VudChzdHJ1Y3Qga2dkX2RldiAqZHN0LCBzdHJ1Y3Qga2dkX2Rl
diAqcwo+PiAgLyogR1BVVk0gQVBJICovCj4+ICBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hY3F1
aXJlX3Byb2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwKPj4gIAkJCQkJc3RydWN0IGZpbGUg
KmZpbHAsIHUzMiBwYXNpZCwKPj4gLQkJCQkJdm9pZCAqKnZtLCB2b2lkICoqcHJvY2Vzc19pbmZv
LAo+PiArCQkJCQl2b2lkICoqcHJvY2Vzc19pbmZvLAo+PiAgCQkJCQlzdHJ1Y3QgZG1hX2ZlbmNl
ICoqZWYpOwo+PiAtdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX3JlbGVhc2VfcHJvY2Vzc192bShz
dHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICp2bSk7Cj4+IC11aW50NjRfdCBhbWRncHVfYW1ka2Zk
X2dwdXZtX2dldF9wcm9jZXNzX3BhZ2VfZGlyKHZvaWQgKnZtKTsKPj4gK3ZvaWQgYW1kZ3B1X2Ft
ZGtmZF9ncHV2bV9yZWxlYXNlX3Byb2Nlc3Nfdm0oc3RydWN0IGtnZF9kZXYgKmtnZCwgdm9pZCAq
ZHJtX3ByaXYpOwo+PiArdWludDY0X3QgYW1kZ3B1X2FtZGtmZF9ncHV2bV9nZXRfcHJvY2Vzc19w
YWdlX2Rpcih2b2lkICpkcm1fcHJpdik7Cj4+ICBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxv
Y19tZW1vcnlfb2ZfZ3B1KAo+PiAgCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCB1aW50NjRfdCB2YSwg
dWludDY0X3Qgc2l6ZSwKPj4gLQkJdm9pZCAqdm0sIHN0cnVjdCBrZ2RfbWVtICoqbWVtLAo+PiAr
CQl2b2lkICpkcm1fcHJpdiwgc3RydWN0IGtnZF9tZW0gKiptZW0sCj4+ICAJCXVpbnQ2NF90ICpv
ZmZzZXQsIHVpbnQzMl90IGZsYWdzKTsKPj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2ZyZWVf
bWVtb3J5X29mX2dwdSgKPj4gIAkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0g
Km1lbSwgdWludDY0X3QgKnNpemUpOwo+PiAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX21l
bW9yeV90b19ncHUoCj4+IC0JCXN0cnVjdCBrZ2RfZGV2ICprZ2QsIHN0cnVjdCBrZ2RfbWVtICpt
ZW0sIHZvaWQgKnZtKTsKPj4gKwkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0g
Km1lbSwgdm9pZCAqZHJtX3ByaXYpOwo+PiAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fdW5tYXBf
bWVtb3J5X2Zyb21fZ3B1KAo+PiAtCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3Qga2dkX21l
bSAqbWVtLCB2b2lkICp2bSk7Cj4+ICsJCXN0cnVjdCBrZ2RfZGV2ICprZ2QsIHN0cnVjdCBrZ2Rf
bWVtICptZW0sIHZvaWQgKmRybV9wcml2KTsKPj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3N5
bmNfbWVtb3J5KAo+PiAgCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3Qga2dkX21lbSAqbWVt
LCBib29sIGludHIpOwo+PiAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fbWFwX2d0dF9ib190b19r
ZXJuZWwoc3RydWN0IGtnZF9kZXYgKmtnZCwKPj4gQEAgLTI2MCw3ICsyNjAsNyBAQCBpbnQgYW1k
Z3B1X2FtZGtmZF9ncHV2bV9nZXRfdm1fZmF1bHRfaW5mbyhzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+
PiAgCQkJCQkgICAgICBzdHJ1Y3Qga2ZkX3ZtX2ZhdWx0X2luZm8gKmluZm8pOwo+PiAgaW50IGFt
ZGdwdV9hbWRrZmRfZ3B1dm1faW1wb3J0X2RtYWJ1ZihzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+PiAg
CQkJCSAgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFidWYsCj4+IC0JCQkJICAgICAgdWludDY0X3Qg
dmEsIHZvaWQgKnZtLAo+PiArCQkJCSAgICAgIHVpbnQ2NF90IHZhLCB2b2lkICpkcm1fcHJpdiwK
Pj4gIAkJCQkgICAgICBzdHJ1Y3Qga2dkX21lbSAqKm1lbSwgdWludDY0X3QgKnNpemUsCj4+ICAJ
CQkJICAgICAgdWludDY0X3QgKm1tYXBfb2Zmc2V0KTsKPj4gIGludCBhbWRncHVfYW1ka2ZkX2dl
dF90aWxlX2NvbmZpZyhzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IGluZGV4IDM2MDEyMjI5Y2Nj
MS4uOTU0NDJiY2Q2MGZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X2FtZGtmZF9ncHV2bS5jCj4+IEBAIC05NTEsNiArOTUxLDEzIEBAIHN0YXRpYyBp
bnQgcHJvY2Vzc191cGRhdGVfcGRzKHN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9jZXNz
X2luZm8sCj4+ICAJcmV0dXJuIDA7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRpYyBzdHJ1Y3QgYW1kZ3B1
X3ZtICpkcm1fcHJpdl90b192bShzdHJ1Y3QgZHJtX2ZpbGUgKmRybV9wcml2KQo+PiArewo+PiAr
CXN0cnVjdCBhbWRncHVfZnByaXYgKmZwcml2ID0gZHJtX3ByaXYtPmRyaXZlcl9wcml2Owo+PiAr
Cj4+ICsJcmV0dXJuICZmcHJpdi0+dm07Cj4+ICt9Cj4+ICsKPj4gIHN0YXRpYyBpbnQgaW5pdF9r
ZmRfdm0oc3RydWN0IGFtZGdwdV92bSAqdm0sIHZvaWQgKipwcm9jZXNzX2luZm8sCj4+ICAJCSAg
ICAgICBzdHJ1Y3QgZG1hX2ZlbmNlICoqZWYpCj4+ICB7Cj4+IEBAIC0xMDM5LDE1ICsxMDQ2LDE5
IEBAIHN0YXRpYyBpbnQgaW5pdF9rZmRfdm0oc3RydWN0IGFtZGdwdV92bSAqdm0sIHZvaWQgKipw
cm9jZXNzX2luZm8sCj4+ICAKPj4gIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX2FjcXVpcmVfcHJv
Y2Vzc192bShzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+PiAgCQkJCQkgICBzdHJ1Y3QgZmlsZSAqZmls
cCwgdTMyIHBhc2lkLAo+PiAtCQkJCQkgICB2b2lkICoqdm0sIHZvaWQgKipwcm9jZXNzX2luZm8s
Cj4+ICsJCQkJCSAgIHZvaWQgKipwcm9jZXNzX2luZm8sCj4+ICAJCQkJCSAgIHN0cnVjdCBkbWFf
ZmVuY2UgKiplZikKPj4gIHsKPj4gIAlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGdldF9h
bWRncHVfZGV2aWNlKGtnZCk7Cj4+IC0Jc3RydWN0IGRybV9maWxlICpkcm1fcHJpdiA9IGZpbHAt
PnByaXZhdGVfZGF0YTsKPj4gLQlzdHJ1Y3QgYW1kZ3B1X2Zwcml2ICpkcnZfcHJpdiA9IGRybV9w
cml2LT5kcml2ZXJfcHJpdjsKPj4gLQlzdHJ1Y3QgYW1kZ3B1X3ZtICphdm0gPSAmZHJ2X3ByaXYt
PnZtOwo+PiArCXN0cnVjdCBhbWRncHVfZnByaXYgKmRydl9wcml2Owo+PiArCXN0cnVjdCBhbWRn
cHVfdm0gKmF2bTsKPj4gIAlpbnQgcmV0Owo+PiAgCj4+ICsJcmV0ID0gYW1kZ3B1X2ZpbGVfdG9f
ZnByaXYoZmlscCwgJmRydl9wcml2KTsKPj4gKwlpZiAocmV0KQo+PiArCQlyZXR1cm4gcmV0Owo+
PiArCWF2bSA9ICZkcnZfcHJpdi0+dm07Cj4+ICsKPj4gIAkvKiBBbHJlYWR5IGEgY29tcHV0ZSBW
TT8gKi8KPj4gIAlpZiAoYXZtLT5wcm9jZXNzX2luZm8pCj4+ICAJCXJldHVybiAtRUlOVkFMOwo+
PiBAQCAtMTA2Miw3ICsxMDczLDcgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWNxdWlyZV9w
cm9jZXNzX3ZtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsCj4+ICAJaWYgKHJldCkKPj4gIAkJcmV0dXJu
IHJldDsKPj4gIAo+PiAtCSp2bSA9ICh2b2lkICopYXZtOwo+PiArCWFtZGdwdV92bV9zZXRfdGFz
a19pbmZvKGF2bSk7Cj4+ICAKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gQEAgLTExMDMsMTUgKzEx
MTQsMTcgQEAgdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX2Rlc3Ryb3lfY2Ioc3RydWN0IGFtZGdw
dV9kZXZpY2UgKmFkZXYsCj4+ICAJfQo+PiAgfQo+PiAgCj4+IC12b2lkIGFtZGdwdV9hbWRrZmRf
Z3B1dm1fcmVsZWFzZV9wcm9jZXNzX3ZtKHN0cnVjdCBrZ2RfZGV2ICprZ2QsIHZvaWQgKnZtKQo+
PiArdm9pZCBhbWRncHVfYW1ka2ZkX2dwdXZtX3JlbGVhc2VfcHJvY2Vzc192bShzdHJ1Y3Qga2dk
X2RldiAqa2dkLCB2b2lkICpkcm1fcHJpdikKPj4gIHsKPj4gIAlzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiA9IGdldF9hbWRncHVfZGV2aWNlKGtnZCk7Cj4+IC0Jc3RydWN0IGFtZGdwdV92bSAq
YXZtID0gKHN0cnVjdCBhbWRncHVfdm0gKil2bTsKPj4gKwlzdHJ1Y3QgYW1kZ3B1X3ZtICphdm07
Cj4+ICAKPj4gLQlpZiAoV0FSTl9PTigha2dkIHx8ICF2bSkpCj4+ICsJaWYgKFdBUk5fT04oIWtn
ZCB8fCAhZHJtX3ByaXYpKQo+PiAgCQlyZXR1cm47Cj4+ICAKPj4gLQlwcl9kZWJ1ZygiUmVsZWFz
aW5nIHByb2Nlc3Mgdm0gJXBcbiIsIHZtKTsKPj4gKwlhdm0gPSBkcm1fcHJpdl90b192bShkcm1f
cHJpdik7Cj4+ICsKPj4gKwlwcl9kZWJ1ZygiUmVsZWFzaW5nIHByb2Nlc3Mgdm0gJXBcbiIsIGF2
bSk7Cj4+ICAKPj4gIAkvKiBUaGUgb3JpZ2luYWwgcGFzaWQgb2YgYW1kZ3B1IHZtIGhhcyBhbHJl
YWR5IGJlZW4KPj4gIAkgKiByZWxlYXNlZCBkdXJpbmcgbWFraW5nIGEgYW1kZ3B1IHZtIHRvIGEg
Y29tcHV0ZSB2bQo+PiBAQCAtMTEyMiw5ICsxMTM1LDkgQEAgdm9pZCBhbWRncHVfYW1ka2ZkX2dw
dXZtX3JlbGVhc2VfcHJvY2Vzc192bShzdHJ1Y3Qga2dkX2RldiAqa2dkLCB2b2lkICp2bSkKPj4g
IAlhbWRncHVfdm1fcmVsZWFzZV9jb21wdXRlKGFkZXYsIGF2bSk7Cj4+ICB9Cj4+ICAKPj4gLXVp
bnQ2NF90IGFtZGdwdV9hbWRrZmRfZ3B1dm1fZ2V0X3Byb2Nlc3NfcGFnZV9kaXIodm9pZCAqdm0p
Cj4+ICt1aW50NjRfdCBhbWRncHVfYW1ka2ZkX2dwdXZtX2dldF9wcm9jZXNzX3BhZ2VfZGlyKHZv
aWQgKmRybV9wcml2KQo+PiAgewo+PiAtCXN0cnVjdCBhbWRncHVfdm0gKmF2bSA9IChzdHJ1Y3Qg
YW1kZ3B1X3ZtICopdm07Cj4+ICsJc3RydWN0IGFtZGdwdV92bSAqYXZtID0gZHJtX3ByaXZfdG9f
dm0oZHJtX3ByaXYpOwo+PiAgCXN0cnVjdCBhbWRncHVfYm8gKnBkID0gYXZtLT5yb290LmJhc2Uu
Ym87Cj4+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVfdHRtX2FkZXYocGQt
PnRiby5iZGV2KTsKPj4gIAo+PiBAQCAtMTEzNSwxMSArMTE0OCwxMSBAQCB1aW50NjRfdCBhbWRn
cHVfYW1ka2ZkX2dwdXZtX2dldF9wcm9jZXNzX3BhZ2VfZGlyKHZvaWQgKnZtKQo+PiAgCj4+ICBp
bnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9hbGxvY19tZW1vcnlfb2ZfZ3B1KAo+PiAgCQlzdHJ1Y3Qg
a2dkX2RldiAqa2dkLCB1aW50NjRfdCB2YSwgdWludDY0X3Qgc2l6ZSwKPj4gLQkJdm9pZCAqdm0s
IHN0cnVjdCBrZ2RfbWVtICoqbWVtLAo+PiArCQl2b2lkICpkcm1fcHJpdiwgc3RydWN0IGtnZF9t
ZW0gKiptZW0sCj4+ICAJCXVpbnQ2NF90ICpvZmZzZXQsIHVpbnQzMl90IGZsYWdzKQo+PiAgewo+
PiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0gZ2V0X2FtZGdwdV9kZXZpY2Uoa2dkKTsK
Pj4gLQlzdHJ1Y3QgYW1kZ3B1X3ZtICphdm0gPSAoc3RydWN0IGFtZGdwdV92bSAqKXZtOwo+PiAr
CXN0cnVjdCBhbWRncHVfdm0gKmF2bSA9IGRybV9wcml2X3RvX3ZtKGRybV9wcml2KTsKPj4gIAll
bnVtIHR0bV9ib190eXBlIGJvX3R5cGUgPSB0dG1fYm9fdHlwZV9kZXZpY2U7Cj4+ICAJc3RydWN0
IHNnX3RhYmxlICpzZyA9IE5VTEw7Cj4+ICAJdWludDY0X3QgdXNlcl9hZGRyID0gMDsKPj4gQEAg
LTEzNTAsMTAgKzEzNjMsMTAgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fZnJlZV9tZW1vcnlf
b2ZfZ3B1KAo+PiAgfQo+PiAgCj4+ICBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9tYXBfbWVtb3J5
X3RvX2dwdSgKPj4gLQkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0gKm1lbSwg
dm9pZCAqdm0pCj4+ICsJCXN0cnVjdCBrZ2RfZGV2ICprZ2QsIHN0cnVjdCBrZ2RfbWVtICptZW0s
IHZvaWQgKmRybV9wcml2KQo+PiAgewo+PiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2ID0g
Z2V0X2FtZGdwdV9kZXZpY2Uoa2dkKTsKPj4gLQlzdHJ1Y3QgYW1kZ3B1X3ZtICphdm0gPSAoc3Ry
dWN0IGFtZGdwdV92bSAqKXZtOwo+PiArCXN0cnVjdCBhbWRncHVfdm0gKmF2bSA9IGRybV9wcml2
X3RvX3ZtKGRybV9wcml2KTsKPj4gIAlpbnQgcmV0Owo+PiAgCXN0cnVjdCBhbWRncHVfYm8gKmJv
Owo+PiAgCXVpbnQzMl90IGRvbWFpbjsKPj4gQEAgLTEzOTQsOSArMTQwNyw5IEBAIGludCBhbWRn
cHVfYW1ka2ZkX2dwdXZtX21hcF9tZW1vcnlfdG9fZ3B1KAo+PiAgCXByX2RlYnVnKCJNYXAgVkEg
MHglbGx4IC0gMHglbGx4IHRvIHZtICVwIGRvbWFpbiAlc1xuIiwKPj4gIAkJCW1lbS0+dmEsCj4+
ICAJCQltZW0tPnZhICsgYm9fc2l6ZSAqICgxICsgbWVtLT5hcWxfcXVldWUpLAo+PiAtCQkJdm0s
IGRvbWFpbl9zdHJpbmcoZG9tYWluKSk7Cj4+ICsJCQlhdm0sIGRvbWFpbl9zdHJpbmcoZG9tYWlu
KSk7Cj4+ICAKPj4gLQlyZXQgPSByZXNlcnZlX2JvX2FuZF92bShtZW0sIHZtLCAmY3R4KTsKPj4g
KwlyZXQgPSByZXNlcnZlX2JvX2FuZF92bShtZW0sIGF2bSwgJmN0eCk7Cj4+ICAJaWYgKHVubGlr
ZWx5KHJldCkpCj4+ICAJCWdvdG8gb3V0Owo+PiAgCj4+IEBAIC0xNDQwLDcgKzE0NTMsNyBAQCBp
bnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9tYXBfbWVtb3J5X3RvX2dwdSgKPj4gIAl9Cj4+ICAKPj4g
IAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmbWVtLT5ib192YV9saXN0LCBib19saXN0KSB7
Cj4+IC0JCWlmIChlbnRyeS0+Ym9fdmEtPmJhc2Uudm0gPT0gdm0gJiYgIWVudHJ5LT5pc19tYXBw
ZWQpIHsKPj4gKwkJaWYgKGVudHJ5LT5ib192YS0+YmFzZS52bSA9PSBhdm0gJiYgIWVudHJ5LT5p
c19tYXBwZWQpIHsKPj4gIAkJCXByX2RlYnVnKCJcdCBtYXAgVkEgMHglbGx4IC0gMHglbGx4IGlu
IGVudHJ5ICVwXG4iLAo+PiAgCQkJCQllbnRyeS0+dmEsIGVudHJ5LT52YSArIGJvX3NpemUsCj4+
ICAJCQkJCWVudHJ5KTsKPj4gQEAgLTE0NTIsNyArMTQ2NSw3IEBAIGludCBhbWRncHVfYW1ka2Zk
X2dwdXZtX21hcF9tZW1vcnlfdG9fZ3B1KAo+PiAgCQkJCWdvdG8gbWFwX2JvX3RvX2dwdXZtX2Zh
aWxlZDsKPj4gIAkJCX0KPj4gIAo+PiAtCQkJcmV0ID0gdm1fdXBkYXRlX3Bkcyh2bSwgY3R4LnN5
bmMpOwo+PiArCQkJcmV0ID0gdm1fdXBkYXRlX3Bkcyhhdm0sIGN0eC5zeW5jKTsKPj4gIAkJCWlm
IChyZXQpIHsKPj4gIAkJCQlwcl9lcnIoIkZhaWxlZCB0byB1cGRhdGUgcGFnZSBkaXJlY3Rvcmll
c1xuIik7Cj4+ICAJCQkJZ290byBtYXBfYm9fdG9fZ3B1dm1fZmFpbGVkOwo+PiBAQCAtMTQ4OCwx
MSArMTUwMSwxMSBAQCBpbnQgYW1kZ3B1X2FtZGtmZF9ncHV2bV9tYXBfbWVtb3J5X3RvX2dwdSgK
Pj4gIH0KPj4gIAo+PiAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1fdW5tYXBfbWVtb3J5X2Zyb21f
Z3B1KAo+PiAtCQlzdHJ1Y3Qga2dkX2RldiAqa2dkLCBzdHJ1Y3Qga2dkX21lbSAqbWVtLCB2b2lk
ICp2bSkKPj4gKwkJc3RydWN0IGtnZF9kZXYgKmtnZCwgc3RydWN0IGtnZF9tZW0gKm1lbSwgdm9p
ZCAqZHJtX3ByaXYpCj4+ICB7Cj4+ICAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBnZXRf
YW1kZ3B1X2RldmljZShrZ2QpOwo+PiAtCXN0cnVjdCBhbWRrZmRfcHJvY2Vzc19pbmZvICpwcm9j
ZXNzX2luZm8gPQo+PiAtCQkoKHN0cnVjdCBhbWRncHVfdm0gKil2bSktPnByb2Nlc3NfaW5mbzsK
Pj4gKwlzdHJ1Y3QgYW1kZ3B1X3ZtICphdm0gPSBkcm1fcHJpdl90b192bShkcm1fcHJpdik7Cj4+
ICsJc3RydWN0IGFtZGtmZF9wcm9jZXNzX2luZm8gKnByb2Nlc3NfaW5mbyA9IGF2bS0+cHJvY2Vz
c19pbmZvOwo+PiAgCXVuc2lnbmVkIGxvbmcgYm9fc2l6ZSA9IG1lbS0+Ym8tPnRiby5iYXNlLnNp
emU7Cj4+ICAJc3RydWN0IGtmZF9ib192YV9saXN0ICplbnRyeTsKPj4gIAlzdHJ1Y3QgYm9fdm1f
cmVzZXJ2YXRpb25fY29udGV4dCBjdHg7Cj4+IEBAIC0xNTAwLDcgKzE1MTMsNyBAQCBpbnQgYW1k
Z3B1X2FtZGtmZF9ncHV2bV91bm1hcF9tZW1vcnlfZnJvbV9ncHUoCj4+ICAKPj4gIAltdXRleF9s
b2NrKCZtZW0tPmxvY2spOwo+PiAgCj4+IC0JcmV0ID0gcmVzZXJ2ZV9ib19hbmRfY29uZF92bXMo
bWVtLCB2bSwgQk9fVk1fTUFQUEVELCAmY3R4KTsKPj4gKwlyZXQgPSByZXNlcnZlX2JvX2FuZF9j
b25kX3ZtcyhtZW0sIGF2bSwgQk9fVk1fTUFQUEVELCAmY3R4KTsKPj4gIAlpZiAodW5saWtlbHko
cmV0KSkKPj4gIAkJZ290byBvdXQ7Cj4+ICAJLyogSWYgbm8gVk1zIHdlcmUgcmVzZXJ2ZWQsIGl0
IG1lYW5zIHRoZSBCTyB3YXNuJ3QgYWN0dWFsbHkgbWFwcGVkICovCj4+IEBAIC0xNTA5LDE3ICsx
NTIyLDE3IEBAIGludCBhbWRncHVfYW1ka2ZkX2dwdXZtX3VubWFwX21lbW9yeV9mcm9tX2dwdSgK
Pj4gIAkJZ290byB1bnJlc2VydmVfb3V0Owo+PiAgCX0KPj4gIAo+PiAtCXJldCA9IHZtX3ZhbGlk
YXRlX3B0X3BkX2Jvcygoc3RydWN0IGFtZGdwdV92bSAqKXZtKTsKPj4gKwlyZXQgPSB2bV92YWxp
ZGF0ZV9wdF9wZF9ib3MoYXZtKTsKPj4gIAlpZiAodW5saWtlbHkocmV0KSkKPj4gIAkJZ290byB1
bnJlc2VydmVfb3V0Owo+PiAgCj4+ICAJcHJfZGVidWcoIlVubWFwIFZBIDB4JWxseCAtIDB4JWxs
eCBmcm9tIHZtICVwXG4iLAo+PiAgCQltZW0tPnZhLAo+PiAgCQltZW0tPnZhICsgYm9fc2l6ZSAq
ICgxICsgbWVtLT5hcWxfcXVldWUpLAo+PiAtCQl2bSk7Cj4+ICsJCWF2bSk7Cj4+ICAKPj4gIAls
aXN0X2Zvcl9lYWNoX2VudHJ5KGVudHJ5LCAmbWVtLT5ib192YV9saXN0LCBib19saXN0KSB7Cj4+
IC0JCWlmIChlbnRyeS0+Ym9fdmEtPmJhc2Uudm0gPT0gdm0gJiYgZW50cnktPmlzX21hcHBlZCkg
ewo+PiArCQlpZiAoZW50cnktPmJvX3ZhLT5iYXNlLnZtID09IGF2bSAmJiBlbnRyeS0+aXNfbWFw
cGVkKSB7Cj4+ICAJCQlwcl9kZWJ1ZygiXHQgdW5tYXAgVkEgMHglbGx4IC0gMHglbGx4IGZyb20g
ZW50cnkgJXBcbiIsCj4+ICAJCQkJCWVudHJ5LT52YSwKPj4gIAkJCQkJZW50cnktPnZhICsgYm9f
c2l6ZSwKPj4gQEAgLTE2NDUsMTQgKzE2NTgsMTQgQEAgaW50IGFtZGdwdV9hbWRrZmRfZ3B1dm1f
Z2V0X3ZtX2ZhdWx0X2luZm8oc3RydWN0IGtnZF9kZXYgKmtnZCwKPj4gIAo+PiAgaW50IGFtZGdw
dV9hbWRrZmRfZ3B1dm1faW1wb3J0X2RtYWJ1ZihzdHJ1Y3Qga2dkX2RldiAqa2dkLAo+PiAgCQkJ
CSAgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFfYnVmLAo+PiAtCQkJCSAgICAgIHVpbnQ2NF90IHZh
LCB2b2lkICp2bSwKPj4gKwkJCQkgICAgICB1aW50NjRfdCB2YSwgdm9pZCAqZHJtX3ByaXYsCj4+
ICAJCQkJICAgICAgc3RydWN0IGtnZF9tZW0gKiptZW0sIHVpbnQ2NF90ICpzaXplLAo+PiAgCQkJ
CSAgICAgIHVpbnQ2NF90ICptbWFwX29mZnNldCkKPj4gIHsKPj4gIAlzdHJ1Y3QgYW1kZ3B1X2Rl
dmljZSAqYWRldiA9IChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqKWtnZDsKPj4gKwlzdHJ1Y3QgYW1k
Z3B1X3ZtICphdm0gPSBkcm1fcHJpdl90b192bShkcm1fcHJpdik7Cj4+ICAJc3RydWN0IGRybV9n
ZW1fb2JqZWN0ICpvYmo7Cj4+ICAJc3RydWN0IGFtZGdwdV9ibyAqYm87Cj4+IC0Jc3RydWN0IGFt
ZGdwdV92bSAqYXZtID0gKHN0cnVjdCBhbWRncHVfdm0gKil2bTsKPj4gIAo+PiAgCWlmIChkbWFf
YnVmLT5vcHMgIT0gJmFtZGdwdV9kbWFidWZfb3BzKQo+PiAgCQkvKiBDYW4ndCBoYW5kbGUgbm9u
LWdyYXBoaWNzIGJ1ZmZlcnMgKi8KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1ka2ZkL2tmZF9wcm9jZXNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJv
Y2Vzcy5jCj4+IGluZGV4IGQ5N2UzMzBhNTAyMi4uYmFkMGVjZDZlZjg3IDEwMDY0NAo+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfcHJvY2Vzcy5jCj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9wcm9jZXNzLmMKPj4gQEAgLTEzODMsMTMgKzEzODMs
MTIgQEAgaW50IGtmZF9wcm9jZXNzX2RldmljZV9pbml0X3ZtKHN0cnVjdCBrZmRfcHJvY2Vzc19k
ZXZpY2UgKnBkZCwKPj4gIAo+PiAgCXJldCA9IGFtZGdwdV9hbWRrZmRfZ3B1dm1fYWNxdWlyZV9w
cm9jZXNzX3ZtKAo+PiAgCQlkZXYtPmtnZCwgZHJtX2ZpbGUsIHAtPnBhc2lkLAo+PiAtCQkmcGRk
LT52bSwgJnAtPmtnZF9wcm9jZXNzX2luZm8sICZwLT5lZik7Cj4+ICsJCSZwLT5rZ2RfcHJvY2Vz
c19pbmZvLCAmcC0+ZWYpOwo+PiAgCWlmIChyZXQpIHsKPj4gIAkJcHJfZXJyKCJGYWlsZWQgdG8g
Y3JlYXRlIHByb2Nlc3MgVk0gb2JqZWN0XG4iKTsKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAl9Cj4+
IC0KPj4gLQlhbWRncHVfdm1fc2V0X3Rhc2tfaW5mbyhwZGQtPnZtKTsKPj4gKwlwZGQtPnZtID0g
ZHJtX2ZpbGUtPnByaXZhdGVfZGF0YTsKPj4gIAo+Cj4gTWF5YmUgaXQgaXMgYmV0dGVyIHRvIHJl
YWQsIHJlbmFtZSBwZGQtPnZtIHRvIHBkZC0+ZHJtX3ByaXYgYXMgd2VsbD8KPgpJIGFncmVlLiBJ
J2xsIHNlbmQgb3V0IGFuIHVwZGF0ZSB3aXRoIHRoYXQgZml4ZWQuCgpSZWdhcmRzLArCoCBGZWxp
eAoKCj4gUGhpbGlwCj4KPj4gIAlyZXQgPSBrZmRfcHJvY2Vzc19kZXZpY2VfcmVzZXJ2ZV9pYl9t
ZW0ocGRkKTsKPj4gIAlpZiAocmV0KQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
