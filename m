Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A032DAEA7
	for <lists+amd-gfx@lfdr.de>; Tue, 15 Dec 2020 15:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1D36E0DF;
	Tue, 15 Dec 2020 14:14:32 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770081.outbound.protection.outlook.com [40.107.77.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DB06E3BB;
 Tue, 15 Dec 2020 14:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nhLr9+2pqRSXv8Vc34ALAh07PH0e3GpMIBgRKpJR3FraYT5n0jRwBDvDO3KQoVex4ZXWXhWT/K1eHD8h5yWBX/1LSmKrqQmgvLwmgZUY30Zp/QiMeAkaouJ/BwmVv+IR+KafnBpe3F1nlI0G5HG6/AzYzw1YOS0PhqP4+3hfEn8CyzBIaPvxBFMFTazcmkFs7ueQ9z3pVTof9Mh1TK/CvZt7YLCtYFH9RzoC0M4ZjjhGi1ZKcrG80d7UoB+/TxqOtSvdzvZEDMLF4mDlYQkmKy9qFBVUxWw8gcqoPp5EuJ+Cx6Iqb5YADZz6uUNR2Sz3nzQqpKHc0KEsRqAD5LrcSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd53RiLN791Q7IrvOvdw2WkAvH8C2nImI7ExgvmI+eI=;
 b=e3W3kLln7+MyWOVl5PEPVlWvdHkPBYmfPGdAj24AGbeVJjDN9/nf5DNvDzeMPMQHdUiyIC/XGaEhravYq2E2onQbTQW5wKihSAxlVhPveGXJvcEybuO0RP4U5SK16z06Zcq8dhK6Tui9nvwGr3QzxYdhXBdatuh2DNpUjLHrAOnNf7NOjfhHbep+rC/sfyUCL2S/6IfLOswxiF/+sa75hxF66IqaGPT1KJOA9APd1pY+OVpwDxxem1l/FrJX48CzDJZhSV5OK00HAdxQhnosjxnut0WTGHjznWnCRZvxIdE9GWCLsH66jwyU6aIlp0z5wTpCVDUPHuhvqcvpyuERQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qd53RiLN791Q7IrvOvdw2WkAvH8C2nImI7ExgvmI+eI=;
 b=qm8R/qu9SEK5aLukByK8vLZUPlkQlEQyVQXa0VOiWFFLfMU+F/TDAYW8Zt5HXgpLXFQ+u2nrC4WD/PGRPFItACVYhkuzxbJgL3T0KMkO+EIuK23MT5gurSCKc4TlF6UjZpNhjhl2a+lby3AJq/MiFbmNSqtWi669DBXts3PJ6LQ=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN6PR12MB1939.namprd12.prod.outlook.com (2603:10b6:404:107::12)
 by BN6PR12MB1250.namprd12.prod.outlook.com (2603:10b6:404:17::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.14; Tue, 15 Dec
 2020 14:14:28 +0000
Received: from BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::cc4e:c277:7731:85df]) by BN6PR12MB1939.namprd12.prod.outlook.com
 ([fe80::cc4e:c277:7731:85df%6]) with mapi id 15.20.3654.025; Tue, 15 Dec 2020
 14:14:28 +0000
Message-ID: <7d0ea3e95605c8ea8fcc0ca5006ba8565dafdb16.camel@amd.com>
Subject: Re: [PATCH v3 2/3] drm/amd/display: Add freesync video modes based
 on preferred modes
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: Shashank Sharma <shashank.sharma@amd.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Date: Tue, 15 Dec 2020 09:14:17 -0500
In-Reply-To: <d3bb5e86-592b-98d8-11cb-cf6b719d0ee3@amd.com>
References: <20201214222036.561352-1-aurabindo.pillai@amd.com>
 <20201214222036.561352-3-aurabindo.pillai@amd.com>
 <d3bb5e86-592b-98d8-11cb-cf6b719d0ee3@amd.com>
User-Agent: Evolution 3.38.2 
X-Originating-IP: [135.23.249.167]
X-ClientProxiedBy: YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::26) To BN6PR12MB1939.namprd12.prod.outlook.com
 (2603:10b6:404:107::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from elite-desk-aura.local (135.23.249.167) by
 YTOPR0101CA0013.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Tue, 15 Dec 2020 14:14:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9838fff-d3b3-4b93-634b-08d8a103bc18
X-MS-TrafficTypeDiagnostic: BN6PR12MB1250:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR12MB12504F6B293F63DDE039A0BC8BC60@BN6PR12MB1250.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bRZ/h8OBuZS8g63aMH+xeC+bJ6nuRrozTqnq2C0WwPu553stqRGPDd0PGnINqF9dgqRTnPqoZNew/rd2mBNTmd6CReFhT6f0pOJvF2qRsPwH/v9sEvOF1BjtHmZAQKW6fCXngNmUt+T+O0DgEVVOQj1V5B0/9oXMnqDXOLmXkNlKdU/dldz9cCM0Kgka5QBfHATUeDUir1j0Jp/xs1vfKNhRiUv/7hy+5uzn+n0ACn2tF39yXDzCtTpqIDe7ymEy0++QGFCNk5hKsceyBEjVK5w9ZwvpnWfvA5oiihLCUfEYJo4q99NV+jKYtBF4jdnqR9isDVt6NSpsWX10y/25b4SCOjPi2CE0JthzBlQLOgA5InUHbLr5utkL1bsuc5oD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR12MB1939.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(376002)(4001150100001)(6506007)(8936002)(508600001)(83380400001)(66556008)(26005)(86362001)(34490700003)(36756003)(8676002)(66476007)(66946007)(6512007)(52116002)(16526019)(4326008)(2616005)(186003)(44832011)(2906002)(450100002)(6486002)(53546011)(956004)(5660300002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0hDTUtyUGdsVVNtNUYrZ3ZaV1dQcVV6bVNzRlVMVW5teW1tYTRESWczS3Y5?=
 =?utf-8?B?RXdOTGFiTDRzT3k2Mi9nenlBMHJtbUpYWnIyMG9YZndaY09rUEJyb29YWGtG?=
 =?utf-8?B?dHRjR0M1MTJveVlDcUNmMEtoQXpWUGsxc2RWS1ZtZWNIQUEzZ3RtTTE5aDJL?=
 =?utf-8?B?UGhOcHJsZmRmQlo0RkZDcXY3cS94V0o2YS9aT0FKajlwbmxJV3hobmtXL3ps?=
 =?utf-8?B?aXYxSTlaVE5YMjdySXVTSFYyRmNsRkVhemNwT0dPZ1lHcUJNTHFKL0tDTzRU?=
 =?utf-8?B?OVRCUzBsWjI1a2JnWTBqeEorNWpOVUNqTVdaK0pyU2gveW9DTHRoeUhIbzhW?=
 =?utf-8?B?U2MxN0MzbnpJVlJCLzdVVUZVY3Qxa0gvMHB6eXNCcVlUK3gvREYrMkR6S2dn?=
 =?utf-8?B?b3Y2cEVpRzh2YkRRZlord3FqbGlhR3ZNazEySThYVDRRcXZaUDRLTUQ3WElX?=
 =?utf-8?B?VFBrRmpmOFdwSVpxMEd2RGJLcm1TNmI5Y2FrUEZqTG4yd053VkhWUEFwZVRm?=
 =?utf-8?B?c2JQei8rTUlUWXV6RmRpaE9TZHZhaDAzRHBEMVZOM0pib2owN3FZaVJxUUlX?=
 =?utf-8?B?STJNcGQ2UlRmYjdRK2VyWHpVa01kVit2bzV2NWdXRGphU05RK0U2NHdyTjhL?=
 =?utf-8?B?TEFjZmpGZ09jL2hMQXRtOWFVRzRpN1RBVU1SQjJjdjB0YlhMTTg1SFhNMkVD?=
 =?utf-8?B?byt4cEh0V3dPemphUFRuVXRqWlNNWmJIZkp6VFJKc0R5ZzdwRjZVemxiZHZH?=
 =?utf-8?B?OWIxN1ROamh2ckp6dVR3NU5PNWQzejFZa2NHOVpVT09Wd01hSndKQmRFSzZk?=
 =?utf-8?B?ZWdaOG95dDRtQi9tZUhnazJrK1o3VW1LdWN2VUs3aFl6aHlJUEJYQkYxZ3ZG?=
 =?utf-8?B?SUQ1M04wQW45Y2hmSnB4d1dRTWo2T1RmM011bkVzZ2puckhzcG9XbHJONWRC?=
 =?utf-8?B?OHgwTDB4eE8wcU9VQ1l6eHE1NjJzZkpRR09Vek9PRysyeDJZczdwLy9KYUNS?=
 =?utf-8?B?TnRxajlXWm5jbGlqS2l3VmJBU0prSEU0WXREMWVNYjJEUTZFaUJBY2JVZVZq?=
 =?utf-8?B?YUJDOC9MUlNxSG12a3hTbzQzMDQ4cXB1UHJYWnc1dlduMmdkeE55TFEreFlh?=
 =?utf-8?B?eDJIQXN1ZDdKaEUwdDNNdHpwelRIdnZMNklZSXRObUl2Q01LWHM0czlTcEZs?=
 =?utf-8?B?YUdvNGxvVzR1NVEzQi9LUlpzS3ZuM2xsQnVrMUtsdWthZ3I3Ymwzc0wzaEpj?=
 =?utf-8?B?ZVo2NElwem1IYkF1MDBYeFVSRVVTYnFLN0o4dmhhb2FmVGoyVllnODJvMlNX?=
 =?utf-8?Q?LHTo3U2HKzG4iHpFZOYWhFkARrY/O7V/HU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BN6PR12MB1939.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 14:14:28.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: b9838fff-d3b3-4b93-634b-08d8a103bc18
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lctOVKRq1fib3fm+ldwRT8wS0T7j5qgqVY60Z7cJwzRQdjKvGp4qDhuqTWIk1f7bdyvnivbfF/+mgdvzDDjQYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1250
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
Cc: alexander.deucher@amd.com, Harry.Wentland@amd.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIwLTEyLTE1IGF0IDA4OjMyICswNTMwLCBTaGFzaGFuayBTaGFybWEgd3JvdGU6
Cj4gCj4gT24gMTUvMTIvMjAgMzo1MCBhbSwgQXVyYWJpbmRvIFBpbGxhaSB3cm90ZToKPiA+IFtX
aHkmSG93XQo+ID4gSWYgZXhwZXJpbWVudGFsIGZyZWVzeW5jIHZpZGVvIG1vZGUgbW9kdWxlIHBh
cmFtZXRlciBpcyBlbmFibGVkLAo+ID4gYWRkCj4gPiBmZXcgZXh0cmEgZGlzcGxheSBtb2RlcyBp
bnRvIHRoZSBkcml2ZXIncyBtb2RlIGxpc3QgY29ycmVzcG9uZGluZwo+ID4gdG8gY29tbW9uCj4g
PiB2aWRlbyBmcmFtZSByYXRlcy4gV2hlbiB1c2Vyc3BhY2Ugc2V0cyB0aGVzZSBtb2Rlcywgbm8g
bW9kZXNldCB3aWxsCj4gPiBiZQo+ID4gcGVyZm9ybWVkIChpZiBjdXJyZW50IG1vZGUgd2FzIG9u
ZSBvZiBmcmVlc3luYyBtb2RlcyBvciB0aGUgYmFzZQo+ID4gZnJlZXN5bmMgbW9kZQo+ID4gYmFz
ZWQgb2ZmIHdoaWNoIHRpbWluZ3MgaGF2ZSBiZWVuIGdlbmVyYXRlZCBmb3IgdGhlIHJlc3Qgb2Yg
dGhlCj4gPiBmcmVlc3luYyBtb2RlcykKPiA+IHNpbmNlIHRoZXNlIG1vZGVzIG9ubHkgZGlmZmVy
IGZyb20gdGhlIGJhc2UgbW9kZSB3aXRoIGZyb250IHBvcmNoCj4gPiB0aW1pbmcuCj4gPiAKPiA+
IFNpZ25lZC1vZmYtYnk6IEF1cmFiaW5kbyBQaWxsYWkgPGF1cmFiaW5kby5waWxsYWlAYW1kLmNv
bT4KPiA+IEFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnIGF0IGFt
ZC5jb20+Cj4gPiAtLS0KPiA+IMKgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2Ft
ZGdwdV9kbS5jIHwgMTY3Cj4gPiArKysrKysrKysrKysrKysrKysKPiA+IMKgLi4uL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5oIHzCoMKgIDIgKwo+ID4gwqAyIGZpbGVz
IGNoYW5nZWQsIDE2OSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCj4gPiBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiA+IGluZGV4IGU3ZWUy
NDY3ZWFkYi4uYzFmZmQzM2U5ZDgzIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ID4gQEAgLTUxNzQsNiArNTE3NCw1
OSBAQCBzdGF0aWMgdm9pZAo+ID4gZG1fZW5hYmxlX3Blcl9mcmFtZV9jcnRjX21hc3Rlcl9zeW5j
KHN0cnVjdCBkY19zdGF0ZSAqY29udGV4dCkKPiA+IMKgwqDCoMKgwqDCoMKgwqBzZXRfbWFzdGVy
X3N0cmVhbShjb250ZXh0LT5zdHJlYW1zLCBjb250ZXh0LT5zdHJlYW1fY291bnQpOwo+ID4gwqB9
Cj4gPiDCoAo+ID4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqCj4gPiArZ2V0X2hp
Z2hlc3RfcmVmcmVzaF9yYXRlX21vZGUoc3RydWN0IGFtZGdwdV9kbV9jb25uZWN0b3IKPiA+ICph
Y29ubmVjdG9yLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBib29sIHVzZV9wcm9iZWRfbW9kZXMpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm0sICptX3ByZWYgPSBOVUxMOwo+ID4gK8KgwqDCoMKg
wqDCoMKgdTE2IGN1cnJlbnRfcmVmcmVzaCwgaGlnaGVzdF9yZWZyZXNoOwo+ID4gK8KgwqDCoMKg
wqDCoMKgc3RydWN0IGxpc3RfaGVhZCAqbGlzdF9oZWFkID0gdXNlX3Byb2JlZF9tb2RlcyA/Cj4g
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmYWNvbm5lY3Rv
ci0KPiA+ID5iYXNlLnByb2JlZF9tb2RlcyA6Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAmYWNvbm5lY3Rvci0KPiA+ID5iYXNlLm1vZGVzOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKGFjb25uZWN0b3ItPmZyZWVzeW5jX3ZpZF9iYXNlLmNsb2Nr
ICE9IDApCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuICZhY29ubmVj
dG9yLT5mcmVlc3luY192aWRfYmFzZTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIEZpbmQg
dGhlIHByZWZlcnJlZCBtb2RlICovCj4gPiArwqDCoMKgwqDCoMKgwqBsaXN0X2Zvcl9lYWNoX2Vu
dHJ5IChtLCBsaXN0X2hlYWQsIGhlYWQpIHsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBpZiAobS0+dHlwZSAmIERSTV9NT0RFX1RZUEVfUFJFRkVSUkVEKSB7Cj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG1fcHJlZiA9IG07Cj4gPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPiA+ICvCoMKgwqDCoMKgwqDCoH0KPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghbV9wcmVmKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgLyogUHJvYmFibHkgYW4gRURJRCB3aXRoIG5vIHByZWZlcnJlZCBtb2Rl
Lgo+ID4gRmFsbGJhY2sgdG8gZmlyc3QgZW50cnkgKi8KPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBtX3ByZWYgPSBsaXN0X2ZpcnN0X2VudHJ5X29yX251bGwoCj4gPiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCZhY29ubmVjdG9yLT5iYXNl
Lm1vZGVzLCBzdHJ1Y3QKPiA+IGRybV9kaXNwbGF5X21vZGUsIGhlYWQpOwo+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICghbV9wcmVmKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoERSTV9ERUJVR19EUklWRVIoIk5vIHByZWZl
cnJlZCBtb2RlIGZvdW5kCj4gPiBpbiBFRElEXG4iKTsKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIE5VTEw7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgfQo+ID4gK8KgwqDCoMKgwqDCoMKgfQo+ID4gKwo+ID4gK8KgwqDC
oMKgwqDCoMKgaGlnaGVzdF9yZWZyZXNoID0gZHJtX21vZGVfdnJlZnJlc2gobV9wcmVmKTsKPiA+
ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBGaW5kIHRoZSBt
b2RlIHdpdGggaGlnaGVzdCByZWZyZXNoIHJhdGUgd2l0aCBzYW1lCj4gPiByZXNvbHV0aW9uLgo+
ID4gK8KgwqDCoMKgwqDCoMKgICogRm9yIHNvbWUgbW9uaXRvcnMsIHByZWZlcnJlZCBtb2RlIGlz
IG5vdCB0aGUgbW9kZSB3aXRoCj4gPiBoaWdoZXN0Cj4gPiArwqDCoMKgwqDCoMKgwqAgKiBzdXBw
b3J0ZWQgcmVmcmVzaCByYXRlLgo+ID4gK8KgwqDCoMKgwqDCoMKgICovCj4gPiArwqDCoMKgwqDC
oMKgwqBsaXN0X2Zvcl9lYWNoX2VudHJ5IChtLCBsaXN0X2hlYWQsIGhlYWQpIHsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjdXJyZW50X3JlZnJlc2jCoCA9IGRybV9tb2RlX3Zy
ZWZyZXNoKG0pOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmICht
LT5oZGlzcGxheSA9PSBtX3ByZWYtPmhkaXNwbGF5ICYmCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG0tPnZkaXNwbGF5ID09IG1fcHJlZi0+dmRpc3BsYXkgJiYKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaGlnaGVzdF9yZWZyZXNoIDwg
Y3VycmVudF9yZWZyZXNoKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoGhpZ2hlc3RfcmVmcmVzaCA9IGN1cnJlbnRfcmVmcmVzaDsKPiA+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgbV9wcmVmID0gbTsKPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiArwqDCoMKgwqDCoMKgwqB9Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgwqBhY29ubmVjdG9yLT5mcmVlc3luY192aWRfYmFzZSA9ICpt
X3ByZWY7Cj4gPiArwqDCoMKgwqDCoMKgwqByZXR1cm4gbV9wcmVmOwo+ID4gK30KPiA+ICsKPiA+
IMKgc3RhdGljIHN0cnVjdCBkY19zdHJlYW1fc3RhdGUgKgo+ID4gwqBjcmVhdGVfc3RyZWFtX2Zv
cl9zaW5rKHN0cnVjdCBhbWRncHVfZG1fY29ubmVjdG9yICphY29ubmVjdG9yLAo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKmRybV9tb2RlLAo+ID4gQEAgLTY5OTksNiArNzA1MiwxMTkgQEAgc3RhdGlj
IHZvaWQKPiA+IGFtZGdwdV9kbV9jb25uZWN0b3JfZGRjX2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLAo+ID4gwqDCoMKgwqDCoMKgwqDCoH0KPiA+IMKgfQo+ID4gwqAK
PiA+ICtzdGF0aWMgYm9vbCBpc19kdXBsaWNhdGVfbW9kZShzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5l
Y3Rvcgo+ID4gKmFjb25uZWN0b3IsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUp
Cj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm07Cj4g
PiArCj4gPiArwqDCoMKgwqDCoMKgwqBsaXN0X2Zvcl9lYWNoX2VudHJ5IChtLCAmYWNvbm5lY3Rv
ci0+YmFzZS5wcm9iZWRfbW9kZXMsCj4gPiBoZWFkKSB7Cj4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKGRybV9tb2RlX2VxdWFsKG0sIG1vZGUpKQo+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsKPiA+ICvCoMKg
wqDCoMKgwqDCoH0KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoHJldHVybiBmYWxzZTsKPiA+ICt9
Cj4gPiArCj4gPiArc3RhdGljIHVpbnQgYWRkX2ZzX21vZGVzKHN0cnVjdCBhbWRncHVfZG1fY29u
bmVjdG9yICphY29ubmVjdG9yLAo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgc3RydWN0IGRldGFpbGVkX2RhdGFfbW9uaXRvcl9yYW5nZSAqcmFuZ2Up
Cj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
Km07Cj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbmV3X21vZGU7
Cj4gPiArwqDCoMKgwqDCoMKgwqB1aW50IGk7Cj4gPiArwqDCoMKgwqDCoMKgwqB1aW50NjRfdCB0
YXJnZXRfdnRvdGFsLCB0YXJnZXRfdnRvdGFsX2RpZmY7Cj4gPiArwqDCoMKgwqDCoMKgwqB1aW50
MzJfdCBuZXdfbW9kZXNfY291bnQgPSAwOwo+ID4gK8KgwqDCoMKgwqDCoMKgdWludDY0X3QgbnVt
LCBkZW47Cj4gTXkgcHJldmlvdXMgcmV2aWV3IGNvbW1lbnQgYWJvdXQgbnVtLGRlbiwgdGFyZ2V0
X3Z0b3RhbCBhbmQKPiB0YXJnZXRfdnRvdGFsX2RpZmYgaGVyZSB3YXMgbmVpdGhlciBhZGRyZXNz
ZWQgbm9yIGV4cGxhaW5lZC4KPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoC8qIFN0YW5kYXJkIEZQ
UyB2YWx1ZXMKPiA+ICvCoMKgwqDCoMKgwqDCoCAqCj4gPiArwqDCoMKgwqDCoMKgwqAgKiAyMy45
NzYgLSBUVi9OVFNDCj4gPiArwqDCoMKgwqDCoMKgwqAgKiAyNMKgwqDCoMKgIC0gQ2luZW1hCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiAyNcKgwqDCoMKgIC0gVFYvUEFMCj4gPiArwqDCoMKgwqDCoMKg
wqAgKiAyOS45N8KgIC0gVFYvTlRTQwo+ID4gK8KgwqDCoMKgwqDCoMKgICogMzDCoMKgwqDCoCAt
IFRWL05UU0MKPiA+ICvCoMKgwqDCoMKgwqDCoCAqIDQ4wqDCoMKgwqAgLSBDaW5lbWEgSEZSCj4g
PiArwqDCoMKgwqDCoMKgwqAgKiA1MMKgwqDCoMKgIC0gVFYvUEFMCj4gPiArwqDCoMKgwqDCoMKg
wqAgKi8KPiBNeSBwcmV2aW91cyByZXZpZXcgY29tbWVudCBhYm91dCA2MCBmcHMgaGVyZSB3YXMg
bmVpdGhlciBhZGRyZXNzZWQKPiBub3IgZXhwbGFpbmVkLgo+IAoKU29ycnkgYWJvdXQgdGhhdCwg
dGhlIGxpc3RfZm9yX2VhY2ggaXMgZ29uZSwgc28gSSdsbCBtb3ZlIGl0IGludG8gdGhlCmZvciBs
b29wLiBJJ2xsIGFkZCB0aGUgY29tbWVudCBhcyB3ZWxsLgoKVGhhbmtzIGZvciB0aGUgcmV2aWV3
IQoKLS0KClRoYW5rcyAmIFJlZ2FyZHMsCkF1cmFiaW5kbyBQaWxsYWkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmFtZC1nZnggbWFpbGluZyBsaXN0CmFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo=
