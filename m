Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5C15BC45
	for <lists+amd-gfx@lfdr.de>; Thu, 13 Feb 2020 11:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DE5D6F591;
	Thu, 13 Feb 2020 10:01:37 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2058.outbound.protection.outlook.com [40.107.93.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B299D6F591;
 Thu, 13 Feb 2020 10:01:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHdl9r76XKNd32/DqWoZiV4n3wvDisBw09kcGeKpgOAHk9yaBBDJLUcsuKWbDzG04118Gfe4wvyUCz1JVSrK7+id9X/4lgGNPz/QWWLeP4vGfS9QubCfyI6z2JhJFBE9LfqP1NQI+l/W4O5msaplbyfOD/9WKaLTTHK0TTM+WtJfKKku0XPM816mpFMt1Wg2l6Zt3QGFV8Cqnl7bY+yfWOEJajPXgoMiuGJUw2AFPp7SFn4NpiLN+OLjuczbV+pvhxzgOmrIcu7zZ28GTvukf2tCRkkifVd6oO9vL63cTCDNqaPlDD8qO8NKm8ks2ktclQHSkrs+coCQ36zb4fsR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB7ZfTUvcz4JStV5nWuG6gl0TouXoZtU5TFLW8ZEvh8=;
 b=enxulSM/PPtHVuJp3eBnbJAAAtPziH3rAaxeVHAy3dRite540yReSRRZKyuL1QqqdA4J63OSg9xSxDZcX1rP9bqZJvqna4pgw5maijJnUbuJz/fV3dG4lSE4txTA23Frail+lJgF8KfWCeIYmzs84RgBYCShG63G8Hew0VDS4cpUEdQoijy9/+DDxXCnyUAX9s4dYLpk2ghbgPvcqYs0XWRFOA0vsIpeu8nha+UXV1Hm3uSgxw1bWT3jfvVQIhei0gXe984gkZS2xXhN41jxrR9c9w1PBeP3SbdSUI/bFAZXxBvlIeuPVuwWoiwEvWTt7TMw91LLf/uKqKDM91vWuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB7ZfTUvcz4JStV5nWuG6gl0TouXoZtU5TFLW8ZEvh8=;
 b=iWvbpsW9UWGMYvyGsyCUdXu9ks4/Sv65/pUdssYUHLx4mIyLyvNMSwU06mlxIEUVaIanoUU+k+icDI22+rRXdedyE98pY6CgIllX8CchVYTLlKdvcgswnlnz19/9Yc0QF7mR847ZRN9lDbviqY/9ZUIhplPcKviQNesa5QxJGRQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1531.namprd12.prod.outlook.com (10.172.39.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.22; Thu, 13 Feb 2020 10:01:29 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::d40e:7339:8605:bc92%11]) with mapi id 15.20.2729.025; Thu, 13 Feb
 2020 10:01:29 +0000
Subject: Re: [PATCH] drm/ttm: replace dma_resv object on deleted BOs v3
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
References: <20200211154326.83858-1-christian.koenig@amd.com>
 <4DECE5E0-0C4A-4F13-89FC-8AC9A5873D04@amd.com>
 <2b8a9318-9b15-0967-b39e-e1579b24d84b@gmail.com>
 <E766BE90-B2B4-4699-BF82-B94A37CD1BA6@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <19dd5965-87a8-ece8-e969-e4a24508cfb5@amd.com>
Date: Thu, 13 Feb 2020 11:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
In-Reply-To: <E766BE90-B2B4-4699-BF82-B94A37CD1BA6@amd.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR01CA0055.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:e6::32) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0055.eurprd01.prod.exchangelabs.com (2603:10a6:208:e6::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2729.24 via Frontend
 Transport; Thu, 13 Feb 2020 10:01:28 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a362c6eb-8509-40f0-2da5-08d7b06bb204
X-MS-TrafficTypeDiagnostic: DM5PR12MB1531:|DM5PR12MB1531:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1531BBDC70FC6A9689065BEA831A0@DM5PR12MB1531.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(39860400002)(376002)(136003)(346002)(366004)(189003)(199004)(478600001)(6636002)(81156014)(31686004)(81166006)(8676002)(66556008)(66946007)(66476007)(186003)(16526019)(8936002)(2906002)(66574012)(4326008)(2616005)(5660300002)(86362001)(6666004)(6862004)(31696002)(36756003)(52116002)(54906003)(6486002)(37006003)(30864003)(316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1531;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +haHnp/1tCZs7AK1jAvKoFEYx8ZvnFz8Gp+GOYlh1kmtcu6wSqgTGakqpPv8f0hlfGbFK/FJx6lXtvAWoB8tgB0gH+Pjdv8tDX0mylNFe1IfZ5cuCn3F6Gx962BCoTN3NZPUkRMyZrH89A3Ggik8IDdKchkvp1mb+965aHjg5W7GslXBBQ7CbPNfeP8XcCUHHqyrOs67AFRIA4zDJ2TXpNwetMGwV+bVnSw2tFC7jECai+s602M1HHB2/+ydu9d/ja13M9Ba6Y3x0fp6oRmpg+mSzSXS14HwmPKILsTH46lmflTtI+Qy1Ez0YIqmRF9Y8gdPTwo6X6YQZB9h5UbREAv4Z6TIWnKYJLAh0KJZUf0+f0gnuldVP6o32EA1gtf1S5uHqXUvX2WwevU4qB2uBEtu3ROnBdciPObMN9sY06zfhPsPwmhvu3XLze0ebAIn
X-MS-Exchange-AntiSpam-MessageData: MkyY/d62YmY8xy49+fwL66AOLxSSaP3KY8muGqW1iVpKwezNvad7MqNQ+aPQtqjVzGQ7w40cGTDdfE4WU+eUphpPVx2QvAjn2pkjcQL+J9o4WAi4w45MntxEWshRW/qOGb+ozPhmCkpnhVY0CRn45LX0NlB4oWodJfcwqca6FzLSHAisfY5+ZRs90ngFn/oduUQOcqD7yKKS6kvQVGvLuw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a362c6eb-8509-40f0-2da5-08d7b06bb204
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2020 10:01:29.3850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lT3rWxf9eaTjv8eK4u84W2OVsFD9anRaLakzI5GdA+9aw9fwt/B4uCX7HoBrLzaL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1531
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMTMuMDIuMjAgdW0gMDU6MTEgc2NocmllYiBQYW4sIFhpbmh1aToKPgo+Cj4+IDIwMjDlubQy
5pyIMTLml6UgMTk6NTPvvIxDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxlaWNodHp1bWVya2Vu
QGdtYWlsLmNvbT4g5YaZ6YGT77yaCj4+Cj4+IEFtIDEyLjAyLjIwIHVtIDA3OjIzIHNjaHJpZWIg
UGFuLCBYaW5odWk6Cj4+Pj4gMjAyMOW5tDLmnIgxMeaXpSAyMzo0M++8jENocmlzdGlhbiBLw7Zu
aWcgPGNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiDlhpnpgZPvvJoKPj4+Pgo+Pj4+
IFdoZW4gbm9uLWltcG9ydGVkIEJPcyBhcmUgcmVzdXJyZWN0ZWQgZm9yIGRlbGF5ZWQgZGVsZXRl
IHdlIHJlcGxhY2UKPj4+PiB0aGUgZG1hX3Jlc3Ygb2JqZWN0IHRvIGFsbG93IGZvciBlYXN5IHJl
Y2xhaW1pbmcgb2YgdGhlIHJlc291cmNlcy4KPj4+Pgo+Pj4+IHYyOiBtb3ZlIHRoYXQgdG8gdHRt
X2JvX2luZGl2aWR1YWxpemVfcmVzdgo+Pj4+IHYzOiBhZGQgYSBjb21tZW50IHRvIGV4cGxhaW4g
d2hhdCdzIGdvaW5nIG9uCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IHhpbmh1aSBwYW4g
PHhpbmh1aS5wYW5AYW1kLmNvbT4KPj4+PiAtLS0KPj4+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jIHwgMTQgKysrKysrKysrKysrKy0KPj4+PiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+Pj4gaW5k
ZXggYmZjNDJhOWU0ZmI0Li44MTc0NjAzZDM5MGYgMTAwNjQ0Cj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPj4+PiBAQCAtMzkzLDYgKzM5MywxOCBAQCBzdGF0aWMgaW50IHR0bV9ib19pbmRpdmlkdWFs
aXplX3Jlc3Yoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPj4+Pgo+Pj4+IAlyID0gZG1h
X3Jlc3ZfY29weV9mZW5jZXMoJmJvLT5iYXNlLl9yZXN2LCBiby0+YmFzZS5yZXN2KTsKPj4+PiAJ
ZG1hX3Jlc3ZfdW5sb2NrKCZiby0+YmFzZS5fcmVzdik7Cj4+Pj4gKwlpZiAocikKPj4+PiArCQly
ZXR1cm4gcjsKPj4+PiArCj4+Pj4gKwlpZiAoYm8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cpIHsK
Pj4+PiArCQkvKiBUaGlzIHdvcmtzIGJlY2F1c2UgdGhlIEJPIGlzIGFib3V0IHRvIGJlIGRlc3Ry
b3llZCBhbmQgbm9ib2R5Cj4+Pj4gKwkJICogcmVmZXJlbmNlIGl0IGFueSBtb3JlLiBUaGUgb25s
eSB0cmlja3kgY2FzZSBpcyB0aGUgdHJ5bG9jayBvbgo+Pj4+ICsJCSAqIHRoZSByZXN2IG9iamVj
dCB3aGlsZSBob2xkaW5nIHRoZSBscnVfbG9jay4KPj4+PiArCQkgKi8KPj4+PiArCQlzcGluX2xv
Y2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKPj4+PiArCQliby0+YmFzZS5yZXN2ID0gJmJvLT5i
YXNlLl9yZXN2Owo+Pj4+ICsJCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4+
Pj4gKwl9Cj4+Pj4KPj4+IGhvdyBhYm91dCBzb21ldGhpbmcgbGlrZSB0aGF0Lgo+Pj4gdGhlIGJh
c2ljIGlkZWEgaXMgdG8gZG8gdGhlIGJvIGNsZWFudXAgd29yayBpbiBibyByZWxlYXNlIGZpcnN0
IGFuZCBhdm9pZCBhbnkgcmFjZSB3aXRoIGV2aWN0Lgo+Pj4gQXMgaW4gYm8gZGllaW5nIHByb2dy
ZXNzLCBldmljdCBhbHNvIGp1c3QgZG8gYm8gY2xlYW51cCB3b3JrLgo+Pj4KPj4+IElmIGJvIGlz
IGJ1c3ksIG5laXRoZXIgYm9fcmVsZWFzZSBub3IgZXZpY3QgIGNhbiBkbyBjbGVhbnVwd29yayAg
b24gaXQuIEZvciB0aGUgYm8gcmVsZWFzZSBjYXNlLCB3ZSBqdXN0IGFkZCBibyBiYWNrIHRvIGxy
dSBsaXN0Lgo+Pj4gU28gd2UgY2FuIGNsZWFuIGl0IHVwICBib3RoIGluIHdvcmtxdWV1ZSBhbmQg
c2hyaW5rZXIgYXMgdGhlIHBhc3Qgd2F5ICBkaWQuCj4+Pgo+Pj4gQEAgLTQwNSw4ICs0MDUsOSBA
QCBzdGF0aWMgaW50IHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3Yoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibykKPj4+ICAgICAgICBpZiAoYm8tPnR5cGUgIT0gdHRtX2JvX3R5cGVfc2cpIHsK
Pj4+ICAgICAgICAgIHNwaW5fbG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+Pj4gLSAgICAg
ICBiby0+YmFzZS5yZXN2ID0gJmJvLT5iYXNlLl9yZXN2Owo+Pj4gKyAgICAgICB0dG1fYm9fZGVs
X2Zyb21fbHJ1KGJvKTsKPj4+ICAgICAgICAgIHNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVf
bG9jayk7Cj4+PiArICAgICAgIGJvLT5iYXNlLnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7Cj4+PiAg
ICAgIH0KPj4+ICAgICAgICByZXR1cm4gcjsKPj4+IEBAIC02MDYsMTAgKzYwNyw5IEBAIHN0YXRp
YyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQo+Pj4gICAgICAgICAgICog
c2hyaW5rZXJzLCBub3cgdGhhdCB0aGV5IGFyZSBxdWV1ZWQgZm9yCj4+PiAgICAgICAgICAgKiBk
ZXN0cnVjdGlvbi4KPj4+ICAgICAgICAgICAqLwo+Pj4gLSAgICAgICBpZiAoYm8tPm1lbS5wbGFj
ZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkgewo+Pj4gKyAgICAgICBpZiAoYm8tPm1lbS5w
bGFjZW1lbnQgJiBUVE1fUExfRkxBR19OT19FVklDVCkKPj4+ICAgICAgICAgICAgICBiby0+bWVt
LnBsYWNlbWVudCAmPSB+VFRNX1BMX0ZMQUdfTk9fRVZJQ1Q7Cj4+PiAtICAgICAgICAgICB0dG1f
Ym9fbW92ZV90b19scnVfdGFpbChibywgTlVMTCk7Cj4+PiAtICAgICAgIH0KPj4+ICsgICAgICAg
dHRtX2JvX2FkZF9tZW1fdG9fbHJ1KGJvLCAmYm8tPm1lbSk7Cj4+PiAgICAgICAgICAgIGtyZWZf
aW5pdCgmYm8tPmtyZWYpOwo+Pj4gICAgICAgICAgbGlzdF9hZGRfdGFpbCgmYm8tPmRkZXN0cm95
LCAmYmRldi0+ZGRlc3Ryb3kpOwo+PiBZZWFoLCB0aG91Z2h0IGFib3V0IHRoYXQgYXMgd2VsbC4g
QnV0IHRoaXMgaGFzIHRoZSBtYWpvciBkcmF3YmFjayB0aGF0IHRoZSBkZWxldGVkIEJPIG1vdmVz
IHRvIHRoZSBlbmQgb2YgdGhlIExSVSwgd2hpY2ggaXMgc29tZXRoaW5nIHdlIGRvbid0IHdhbnQu
Cj4gd2VsbCwgYXMgdGhlIGJvIGlzIGJ1c3ksIGxvb2tzIGxpa2UgaXQgbmVlZHMgdGltZSB0byBi
ZWluZyBpZGxlLiBwdXR0aW5nIGl0IHRvIHRhaWwgc2VlbXMgZmFpci4KCk5vLCBzZWUgQk9zIHNo
b3VsZCBtb3ZlIHRvIHRoZSB0YWlsIG9mIHRoZSBMUlUgd2hlbmV2ZXIgdGhleSBhcmUgdXNlZC4g
CkZyZWVpbmcgdXAgYSBCTyBpcyBiYXNpY2FsbHkgdGhlIG9wcG9zaXRlIG9mIHVzaW5nIGl0LgoK
U28gd2hhdCB3b3VsZCBoYXBwZW4gb24gdGhlIG5leHQgbWVtb3J5IGNvbnRlbnRpb24gaXMgdGhh
dCB0aGUgTU0gd291bGQgCmV2aWN0IEJPcyB3aGljaCBhcmUgc3RpbGwgdXNlZCBhbmQgb25seSBh
ZnRlciBjb21lIHRvIHRoZSBkZWxldGUgQk8gCndoaWNoIGNvdWxkIGhhdmUgYmVlbiByZW1vdmVk
IGxvbmcgYWdvLgoKPj4gSSB0aGluayB0aGUgcmVhbCBzb2x1dGlvbiB0byB0aGlzIHByb2JsZW0g
aXMgdG8gZ28gYSBjb21wbGV0ZWx5IGRpZmZlcmVudCB3YXkgYW5kIHJlbW92ZSB0aGUgZGVsYXll
ZCBkZWxldGUgZmVhdHVyZSBmcm9tIFRUTSBhbHRvZ2V0aGVyLiBJbnN0ZWFkIHRoaXMgc2hvdWxk
IGJlIHBhcnQgb2Ygc29tZSBEUk0gZG9tYWluIGhhbmRsZXIgY29tcG9uZW50Lgo+Pgo+IHllcywg
Y29tcGxldGVseSBhZ3JlZS4gQXMgbG9uZyBhcyB3ZSBjYW4gc2hyaW5rIGJvcyB3aGVuIE9PTSwg
dGhlIHdvcmtxdWV1ZSBpcyBub3QgbmVjZXNzYXJ5LCBUaGUgd29ya3F1ZXVlIGRvZXMgbm90ICBo
ZWxwIGluIGEgaGVhdnkgd29ya2xvYWQgY2FzZS4KPgo+IFBscyBzZWUgbXkgcGF0Y2hlcyBiZWxv
dywgSSByZW1vdmUgdGhlIHdvcmtxdWV1ZSwgYW5kIHdoYXTigJlzIG1vcmUsIHdlIGNhbiBjbGVh
cnVwIHRoZSBibyB3aXRob3V0IGxydSBsb2NrIGhvbGQuCj4gVGhhdCB3b3VsZCByZWR1Y2UgdGhl
IGxvY2sgY29udGVudGlvbi4gSSBydW4ga2ZkdGVzdCBhbmQgZ290IGEgZ29vZCBwZXJmb3JtYW5j
ZSByZXN1bHQuCgpObywgdGhhdCdzIGFuIGFwcHJvYWNoIHdlIGhhZCBiZWZvcmUgYXMgd2VsbCBh
bmQgaXQgYWxzbyBkb2Vzbid0IHdvcmsgCnRoYXQgd2VsbC4KClNlZSB0aGUgcHJvYmxlbSBpcyB0
aGF0IHdlIGNhbiBvbmx5IHJlbW92ZSB0aGUgQk8gZnJvbSB0aGUgTFJVIGFmdGVyIGl0IApoYXMg
cmVsZWFzZWQgdGhlIG1lbW9yeSBpdCByZWZlcmVuY2VzLiBPdGhlcndpc2Ugd2UgcnVuIGludG8g
dGhlIGlzc3VlIAp0aGF0IHNvbWUgdGhyZWFkcyBjYW4ndCB3YWl0IGZvciB0aGUgbWVtb3J5IHRv
IGJlIGZyZWVkIGFueSBtb3JlIGFuZCBydW4gCmludG8gYW4gT09NIHNpdHVhdGlvbi4KClJlZ2Fy
ZHMsCkNocmlzdGlhbi4KCj4KPgo+PiBJbiBvdGhlciB3b3JkcyBpdCBzaG91bGQgbm90IG1hdHRl
ciBpZiBhIEJPIGlzIGV2aWN0ZWQsIG1vdmVkIG9yIGZyZWVkLiBXaGVuZXZlciBhIHBpZWNlIG9m
IG1lbW9yeSBiZWNvbWVzIGF2YWlsYWJsZSBhZ2FpbiB3ZSBrZWVwIGFyb3VuZCBhIGZlbmNlIHdo
aWNoIG1hcmtzIHRoZSBlbmQgb2YgdXNpbmcgdGhpcyBwaWVjZSBvZiBtZW1vcnkuCj4+Cj4+IFdo
ZW4gdGhlbiBzb21lYm9keSBhc2tzIGZvciBuZXcgbWVtb3J5IHdlIHdvcmsgdGhyb3VnaCB0aGUg
TFJVIGFuZCB0ZXN0IGlmIHVzaW5nIGEgY2VydGFpbiBwaWVjZSBvZiBtZW1vcnkgbWFrZXMgc2Vu
c2Ugb3Igbm90LiBJZiB3ZSBmaW5kIHRoYXQgYSBCTyBuZWVkcyB0byBiZSBldmljdGVkIGZvciB0
aGlzIHdlIHJldHVybiBhIHJlZmVyZW5jZSB0byB0aGUgQk8gaW4gcXVlc3Rpb24gdG8gdGhlIHVw
cGVyIGxldmVsIGhhbmRsaW5nLgo+Pgo+PiBJZiB3ZSBmaW5kIHRoYXQgd2UgY2FuIGRvIHRoZSBh
bGxvY2F0aW9uIGJ1dCBvbmx5IHdpdGggcmVjZW50bHkgZnJlZWQgdXAgbWVtb3J5IHdlIGdhdGhl
ciB0aGUgZmVuY2VzIGFuZCBzYXkgeW91IGNhbiBvbmx5IHVzZSB0aGUgbmV3bHkgYWxsb2NhdGVk
IG1lbW9yeSBhZnRlciB3YWl0aW5nIGZvciB0aG9zZS4KPj4KPj4gSEVZISBXYWl0IGEgc2Vjb25k
ISBEaWQgSSBqdXN0IG91dGxpbmVkIHdoYXQgYSBwb3RlbnRpYWwgcmVwbGFjZW1lbnQgdG8gVFRN
IHdvdWxkIGxvb2sgbGlrZT8KPiB5ZXMsIHRoYXQgaXMgYSBnb29kIHBpY3R1cmUuIExvb2tzIGxp
a2Ugd2UgY291bGQgZG8gbW9yZSB3b3JrIGhlbi4gOikKPgo+IHRoYW5rcwo+IHhpbmh1aQo+Cj4K
PiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jCj4gaW5kZXggZTc5NWQ1YjVmOGFmLi5hYzgyNmEwOWI0ZWMgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKPiBAQCAtNDA1LDYgKzQwNSw5IEBAIHN0YXRpYyBpbnQgdHRtX2JvX2lu
ZGl2aWR1YWxpemVfcmVzdihzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQo+ICAgCj4gICAJ
aWYgKGJvLT50eXBlICE9IHR0bV9ib190eXBlX3NnKSB7Cj4gICAJCXNwaW5fbG9jaygmdHRtX2Jv
X2dsb2IubHJ1X2xvY2spOwo+ICsJCS8qIGl0IGlzIHZlcnkgbGlrZWx5IHRvIHJlbGVhc2UgYm8g
c3VjY2Vzc2Z1bGx5Lgo+ICsJCSAqIGlmIG5vdCwganVzdCBhZGRpbmcgaXQgYmFjay4KPiArCQkg
Ki8KPiAgIAkJdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4gICAJCXNwaW5fdW5sb2NrKCZ0dG1f
Ym9fZ2xvYi5scnVfbG9jayk7Cj4gICAJCWJvLT5iYXNlLnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7
Cj4gQEAgLTQ2NiwxOCArNDY5LDIwIEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFudXBfcmVmcyhz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCj4gICAJCWlmICh1bmxvY2tfcmVzdikK
PiAgIAkJCWRtYV9yZXN2X3VubG9jayhiby0+YmFzZS5yZXN2KTsKPiAtCQlzcGluX3VubG9jaygm
dHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+ICAgCj4gICAJCWxyZXQgPSBkbWFfcmVzdl93YWl0X3Rp
bWVvdXRfcmN1KHJlc3YsIHRydWUsIGludGVycnVwdGlibGUsCj4gICAJCQkJCQkgMzAgKiBIWik7
Cj4gICAKPiAgIAkJaWYgKGxyZXQgPCAwKQo+IC0JCQlyZXR1cm4gbHJldDsKPiAtCQllbHNlIGlm
IChscmV0ID09IDApCj4gLQkJCXJldHVybiAtRUJVU1k7Cj4gKwkJCWdvdG8gYnVzeTsKPiArCQll
bHNlIGlmIChscmV0ID09IDApIHsKPiArCQkJcmV0ID0gLUVCVVNZOwo+ICsJCQlnb3RvIGJ1c3k7
Cj4gKwkJfQo+ICAgCj4gLQkJc3Bpbl9sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4gICAJ
CWlmICh1bmxvY2tfcmVzdiAmJiAhZG1hX3Jlc3ZfdHJ5bG9jayhiby0+YmFzZS5yZXN2KSkgewo+
ICsJCQkvKiBubyByYWNlIHNob3VsZCBiZSBvbiBpdCBub3cgKi8KPiArCQkJQlVHKCk7Cj4gICAJ
CQkvKgo+ICAgCQkJICogV2UgcmFjZWQsIGFuZCBsb3N0LCBzb21lb25lIGVsc2UgaG9sZHMgdGhl
IHJlc2VydmF0aW9uIG5vdywKPiAgIAkJCSAqIGFuZCBpcyBwcm9iYWJseSBidXN5IGluIHR0bV9i
b19jbGVhbnVwX21lbXR5cGVfdXNlLgo+IEBAIC00ODYsMjAgKzQ5MSwxOCBAQCBzdGF0aWMgaW50
IHR0bV9ib19jbGVhbnVwX3JlZnMoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJ
CSAqIGRlbGF5ZWQgZGVzdHJ1Y3Rpb24gd291bGQgc3VjY2VlZCwgc28ganVzdCByZXR1cm4gc3Vj
Y2Vzcwo+ICAgCQkJICogaGVyZS4KPiAgIAkJCSAqLwo+IC0JCQlzcGluX3VubG9jaygmdHRtX2Jv
X2dsb2IubHJ1X2xvY2spOwo+ICAgCQkJcmV0dXJuIDA7Cj4gICAJCX0KPiAgIAkJcmV0ID0gMDsK
PiAgIAl9Cj4gICAKPiAtCWlmIChyZXQgfHwgdW5saWtlbHkobGlzdF9lbXB0eSgmYm8tPmRkZXN0
cm95KSkpIHsKPiArCWlmIChyZXQpIHsKPiAgIAkJaWYgKHVubG9ja19yZXN2KQo+ICAgCQkJZG1h
X3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOwo+IC0JCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xv
Yi5scnVfbG9jayk7Cj4gLQkJcmV0dXJuIHJldDsKPiArCQlnb3RvIGJ1c3k7Cj4gICAJfQo+ICAg
Cj4gLQl0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKPiArCXNwaW5fbG9jaygmdHRtX2JvX2dsb2Iu
bHJ1X2xvY2spOwo+ICAgCWxpc3RfZGVsX2luaXQoJmJvLT5kZGVzdHJveSk7Cj4gICAJc3Bpbl91
bmxvY2soJnR0bV9ib19nbG9iLmxydV9sb2NrKTsKPiAgIAl0dG1fYm9fY2xlYW51cF9tZW10eXBl
X3VzZShibyk7Cj4gQEAgLTUxMCwxMSArNTEzLDIwIEBAIHN0YXRpYyBpbnQgdHRtX2JvX2NsZWFu
dXBfcmVmcyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+ICAgCXR0bV9ib19wdXQoYm8p
Owo+ICAgCj4gICAJcmV0dXJuIDA7Cj4gKwo+ICtidXN5Ogo+ICsJc3Bpbl9sb2NrKCZ0dG1fYm9f
Z2xvYi5scnVfbG9jayk7Cj4gKwl0dG1fYm9fYWRkX21lbV90b19scnUoYm8sICZiby0+bWVtKTsK
PiArCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7Cj4gKwo+ICsJcmV0dXJuICBy
ZXQ7Cj4gICB9Cj4gICAKPiAgIC8qKgo+ICAgICogVHJhdmVyc2UgdGhlIGRlbGF5ZWQgbGlzdCwg
YW5kIGNhbGwgdHRtX2JvX2NsZWFudXBfcmVmcyBvbiBhbGwKPiAgICAqIGVuY291bnRlcmVkIGJ1
ZmZlcnMuCj4gKyAqCj4gKyAqIG9ubHkgY2FsbGVkIGJvIGRldmljZSByZWxlYXNlCj4gICAgKi8K
PiAgIHN0YXRpYyBib29sIHR0bV9ib19kZWxheWVkX2RlbGV0ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwgYm9vbCByZW1vdmVfYWxsKQo+ICAgewo+IEBAIC01MzMsMTcgKzU0NSwxNyBAQCBz
dGF0aWMgYm9vbCB0dG1fYm9fZGVsYXllZF9kZWxldGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJk
ZXYsIGJvb2wgcmVtb3ZlX2FsbCkKPiAgIAkJbGlzdF9tb3ZlX3RhaWwoJmJvLT5kZGVzdHJveSwg
JnJlbW92ZWQpOwo+ICAgCQlpZiAoIXR0bV9ib19nZXRfdW5sZXNzX3plcm8oYm8pKQo+ICAgCQkJ
Y29udGludWU7Cj4gKwkJdHRtX2JvX2RlbF9mcm9tX2xydShibyk7Cj4gKwkJc3Bpbl91bmxvY2so
Jmdsb2ItPmxydV9sb2NrKTsKPiAgIAo+ICAgCQlpZiAocmVtb3ZlX2FsbCB8fCBiby0+YmFzZS5y
ZXN2ICE9ICZiby0+YmFzZS5fcmVzdikgewo+IC0JCQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xv
Y2spOwo+ICAgCQkJZG1hX3Jlc3ZfbG9jayhiby0+YmFzZS5yZXN2LCBOVUxMKTsKPiAtCj4gLQkJ
CXNwaW5fbG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+ICAgCQkJdHRtX2JvX2NsZWFudXBfcmVmcyhi
bywgZmFsc2UsICFyZW1vdmVfYWxsLCB0cnVlKTsKPiAtCj4gICAJCX0gZWxzZSBpZiAoZG1hX3Jl
c3ZfdHJ5bG9jayhiby0+YmFzZS5yZXN2KSkgewo+ICAgCQkJdHRtX2JvX2NsZWFudXBfcmVmcyhi
bywgZmFsc2UsICFyZW1vdmVfYWxsLCB0cnVlKTsKPiAgIAkJfSBlbHNlIHsKPiArCQkJc3Bpbl9s
b2NrKCZnbG9iLT5scnVfbG9jayk7Cj4gKwkJCXR0bV9ib19hZGRfbWVtX3RvX2xydShibywgJmJv
LT5tZW0pOwo+ICAgCQkJc3Bpbl91bmxvY2soJmdsb2ItPmxydV9sb2NrKTsKPiAgIAkJfQo+ICAg
Cj4gQEAgLTU1OSwxMiArNTcxLDggQEAgc3RhdGljIGJvb2wgdHRtX2JvX2RlbGF5ZWRfZGVsZXRl
KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBib29sIHJlbW92ZV9hbGwpCj4gICAKPiAgIHN0
YXRpYyB2b2lkIHR0bV9ib19kZWxheWVkX3dvcmtxdWV1ZShzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCj4gICB7Cj4gLQlzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiA9Cj4gLQkgICAgY29udGFp
bmVyX29mKHdvcmssIHN0cnVjdCB0dG1fYm9fZGV2aWNlLCB3cS53b3JrKTsKPiAtCj4gLQlpZiAo
IXR0bV9ib19kZWxheWVkX2RlbGV0ZShiZGV2LCBmYWxzZSkpCj4gLQkJc2NoZWR1bGVfZGVsYXll
ZF93b3JrKCZiZGV2LT53cSwKPiAtCQkJCSAgICAgICgoSFogLyAxMDApIDwgMSkgPyAxIDogSFog
LyAxMDApOwo+ICsJV0FSTih0cnVlLCAiZG8gbm90IHNjaGVkdWxlIGl0Iik7Cj4gKwlyZXR1cm47
Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxlYXNlKHN0cnVjdCBrcmVmICpr
cmVmKQo+IEBAIC01OTUsNiArNjAzLDcgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVhc2Uoc3Ry
dWN0IGtyZWYgKmtyZWYpCj4gICAJCXR0bV9tZW1faW9fdW5sb2NrKG1hbik7Cj4gICAJfQo+ICAg
Cj4gKwkvKiBpZiBibyBpcyBidXN5LCBzcGVuZCBhIGxpdHRsZSBtb3JlIHRpbWUgdG8gYWRkIGJv
IHRvIGxydSBhbmQgZGRlc3Ryb3kgbGlzdCovCj4gICAJaWYgKCFkbWFfcmVzdl90ZXN0X3NpZ25h
bGVkX3JjdShiby0+YmFzZS5yZXN2LCB0cnVlKSkgewo+ICAgCQkvKiBUaGUgQk8gaXMgbm90IGlk
bGUsIHJlc3VycmVjdCBpdCBmb3IgZGVsYXllZCBkZXN0cm95ICovCj4gICAJCXR0bV9ib19mbHVz
aF9hbGxfZmVuY2VzKGJvKTsKPiBAQCAtNjE1LDggKzYyNCw2IEBAIHN0YXRpYyB2b2lkIHR0bV9i
b19yZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQo+ICAgCQlsaXN0X2FkZF90YWlsKCZiby0+ZGRl
c3Ryb3ksICZiZGV2LT5kZGVzdHJveSk7Cj4gICAJCXNwaW5fdW5sb2NrKCZ0dG1fYm9fZ2xvYi5s
cnVfbG9jayk7Cj4gICAKPiAtCQlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmJkZXYtPndxLAo+IC0J
CQkJICAgICAgKChIWiAvIDEwMCkgPCAxKSA/IDEgOiBIWiAvIDEwMCk7Cj4gICAJCXJldHVybjsK
PiAgIAl9Cj4gICAKPiBAQCAtODQyLDYgKzg0OSw5IEBAIHN0YXRpYyBpbnQgdHRtX21lbV9ldmlj
dF9maXJzdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKPiAgIAkJcmV0dXJuIHJldDsKPiAg
IAl9Cj4gICAKPiArCXR0bV9ib19kZWxfZnJvbV9scnUoYm8pOwo+ICsJc3Bpbl91bmxvY2soJnR0
bV9ib19nbG9iLmxydV9sb2NrKTsKPiArCj4gICAJaWYgKGJvLT5kZWxldGVkKSB7Cj4gICAJCXJl
dCA9IHR0bV9ib19jbGVhbnVwX3JlZnMoYm8sIGN0eC0+aW50ZXJydXB0aWJsZSwKPiAgIAkJCQkJ
ICBjdHgtPm5vX3dhaXRfZ3B1LCBsb2NrZWQpOwo+IEBAIC04NDksOCArODU5LDYgQEAgc3RhdGlj
IGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAo+ICAg
CQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IC0Jc3Bpbl91bmxvY2soJnR0bV9ib19nbG9iLmxy
dV9sb2NrKTsKPiAtCj4gICAJcmV0ID0gdHRtX2JvX2V2aWN0KGJvLCBjdHgpOwo+ICAgCWlmIChs
b2NrZWQpCj4gICAJCXR0bV9ib191bnJlc2VydmUoYm8pOwo+IEBAIC0xODA5LDE0ICsxODE3LDE1
IEBAIGludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2JvX2dsb2JhbCAqZ2xvYiwgc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCj4gICAJCXJldHVybiByZXQ7Cj4gICAJfQo+ICAgCj4g
Kwl0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKPiArCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9j
ayk7Cj4gKwo+ICAgCWlmIChiby0+ZGVsZXRlZCkgewo+ICAgCQlyZXQgPSB0dG1fYm9fY2xlYW51
cF9yZWZzKGJvLCBmYWxzZSwgZmFsc2UsIGxvY2tlZCk7Cj4gICAJCXR0bV9ib19wdXQoYm8pOwo+
ICAgCQlyZXR1cm4gcmV0Owo+ICAgCX0KPiAgIAo+IC0JdHRtX2JvX2RlbF9mcm9tX2xydShibyk7
Cj4gLQlzcGluX3VubG9jaygmZ2xvYi0+bHJ1X2xvY2spOwo+ICAgCj4gICAJLyoqCj4gICAJICog
TW92ZSB0byBzeXN0ZW0gY2FjaGVkCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwphbWQtZ2Z4IG1haWxpbmcgbGlzdAphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ft
ZC1nZngK
