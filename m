Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 305314AB365
	for <lists+amd-gfx@lfdr.de>; Mon,  7 Feb 2022 04:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F25D610E457;
	Mon,  7 Feb 2022 03:08:16 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7A010E457;
 Mon,  7 Feb 2022 03:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhrR0MPi8fUJv9fgJOlgJW8N3q8GmDCGL6XjX7xT3TqW4IR5e7NHjLyjchWgVr7EMGglivWz473y985K5jmhFakxKqqas4sC+KEI454gAuo5XCj5QPOXk+Q8q0twbqvxlkJjG3SlQPj9bzdA3i8R16a/BCSJQH5bgFFT8yKo5d9i+v3CEJZ1k+qU3p91iX07FWafpUOGDbazIRlZERH9Wo13AVvHxEnSUXNF3SpN+Waqk8nN5PCsj4Qq18Gj5uf4JQjobiAEpNS8TaD2h2P2THHt9vK6IA5B/YdrE+q7p3+FN+XWkz8rmqLngxTWsydTnBn/cBgyJWjoA/3tMaSQsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rr2vI9QTi3BJPUIu/q6aSffJDumzPzgknMnJUlcxjZc=;
 b=cmIGL8S/TxUyMMJBNTj7Vt62RCFsHqZHitCanGSiVn7aVe8Or79vd9XVi2cmQ3W6r8hcFb0seLpgD9AckouSBNpA/rwX9yLVEqElIS9YyKaMa4ZsrHx6hiJHw/7b0oOjvkXIpX5hmFqEeGY+eKRGitXcVoK6L4VHVp7NkORo7sKPiv2vl2DxJPZ9GFYxu2VjzLTf8K6vqnR3amH+KKPGzn9nL8CnMcqkEy1taJHUg0c2Dz3YJ+vn86XLj5EqzvKDJ1lo9Z1dgzTnabhJQdTH/oPhJzKa0XfWNcRIRCXvkMWkJ3q2Ij2Zz6/+qFzI3ll6sIK4rjs+jynP6wvGsJkvww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rr2vI9QTi3BJPUIu/q6aSffJDumzPzgknMnJUlcxjZc=;
 b=HxWQMUyOgecnZSs8WMMS3JCGbxMJYcMWRFH4I3vUk+WloAJ4/wypvg9Y2yz3zhDfzDjc1RUizLdXpvlwkBgpFlVszW7TMTd/bPr8BLgvZ5oSgw6U4Nwa9xYXnIBUwUtPgWSkimn0iBj/jqK1n8wTHBGKGEK+YHDPIEuh+VfAJ38=
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by MWHPR12MB1486.namprd12.prod.outlook.com (2603:10b6:301:10::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 03:08:12 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::a105:faab:243:1dd3%11]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 03:08:12 +0000
From: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
To: "Chen, JingWen" <JingWen.Chen2@amd.com>,
 =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Lazar, Lijo"
 <Lijo.Lazar@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "Liu, Shaoyun" <Shaoyun.Liu@amd.com>
Subject: Re: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Thread-Topic: [RFC v2 4/8] drm/amdgpu: Serialize non TDR gpu recovery with TDRs
Thread-Index: AQHX94AbPVgo6Mqr0UqM3sQHdT5sp6xURYIAgAArzQCAAF8UAIAS7YQAgAAA1YCAAAEFAIAN6o0AgAM2+8yADsgPAIAABs2U
Date: Mon, 7 Feb 2022 03:08:11 +0000
Message-ID: <DM5PR12MB1947190DDF78698A8692D423EA2C9@DM5PR12MB1947.namprd12.prod.outlook.com>
References: <20211222220506.789133-1-andrey.grodzovsky@amd.com>
 <20211222220506.789133-5-andrey.grodzovsky@amd.com>
 <639bd7c3-e946-65eb-afae-dd619f6429d6@amd.com>
 <9dc55576-19b1-d5e3-f4da-eede4db8b289@amd.com>
 <c64c933f-498d-a2d9-fe63-058c6f1bed9c@amd.com>
 <62f9f1c2-312b-760e-75f7-e86421333be3@amd.com>
 <096c0884-7e32-40ed-7570-b65f19104f5f@gmail.com>
 <769b97dd-c6f9-88fe-a26b-34bfd617e257@amd.com>
 <17b6f133-1b7b-7fcb-5fb2-17edcac50a72@amd.com>
 <DM5PR12MB19474AEFB824C4C97DCD7AABEA229@DM5PR12MB1947.namprd12.prod.outlook.com>
 <4119e53a-29c5-bb80-10c4-d1e66b91d83b@amd.com>
In-Reply-To: <4119e53a-29c5-bb80-10c4-d1e66b91d83b@amd.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37e17740-8e50-4200-c038-08d9e9e71385
x-ms-traffictypediagnostic: MWHPR12MB1486:EE_
x-microsoft-antispam-prvs: <MWHPR12MB14865395CD834CB5E1476737EA2C9@MWHPR12MB1486.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DzIW16eMp7JtgYOwbTzmgWo9rltE2oYefs3yWaZpdkgISBeUeWHtPgCxhxUZv8wpMbxtaI5P/LORvh/DxTcpctmXs28H2ZJavM3OSFuZVDHgY6jw2YEsAs8ELABWaeOjM5/zwpQIGNHfAJBwbq+SCiJY9O2WeUiWhHe8RhdcfGILE+QizDj7MADj6Zs4mMpRhql847p1Z7W1IwYcnYlGuAyDq+CxwUWU4ZGKJdZxII8KKi7XNbqR957LY+KG34iVS9tLDAYP1hP/+aS0ldRy1cvnOFv7oEPB0ESbFQ3Nng5yT8rUwwtxhXE6MGc2TUKReiFmboTPFYGVMnEyV7GA9rFof99MNunmzJEYpXUF1ES/vPJyr4Mx6Ty+jJxVaQLg0C5Z9BvVjfZkcFjQI/9AKesTfhyy3Uzo/58oNud6ioCpzISodq+sNapnaId01pilR8Lgc/XIvAV8mtnWLKbinnlbiIEv0cjhgZX2nyOe2WBTPdopCEUQt4blU7yF7RHI5ijknq4PICSpfZBo6Bgie570s2ZK2oUfVGGQoXG0SGng4kaEQ/ALnwRtZMaC1HPk9aLYeNF/eOHZhK/2l3xbsD1uN+lZEiyoIQ78UI2t5QPpW5D9qs2905RTQ/rrB7XkfT8ZgWWPXviLsxAKYOvViykOR66SLTuZC50Du/2asJ4uLywB5vkMmfcUsLhTlYhSTB+tJG/9/+y2jQM4US+yog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(66946007)(91956017)(38070700005)(86362001)(4326008)(8676002)(8936002)(76116006)(66556008)(66446008)(66476007)(83380400001)(64756008)(5660300002)(33656002)(508600001)(55016003)(66574015)(71200400001)(6636002)(186003)(54906003)(316002)(6506007)(921005)(9686003)(7696005)(53546011)(110136005)(38100700002)(122000001)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RWc2TUg5RkVjdDdpa0l4dUpvSWY0cUdIVXVrVUZicWdQeXNPYnFiMmkwSUNa?=
 =?utf-8?B?enlYUjhneitmaU81TERQNHR0cXF4Mi9RclZ0NTlsMWxjVVVKbExTUHd2eUp5?=
 =?utf-8?B?L2pBUFBIdURLT2xyUUp0NFdTOUhlWEpFSW4yQk44UWN5Sml4S3FPenZOY2lE?=
 =?utf-8?B?d29ucjNBM3dodFJIK1h4MHhpKzdnVFRta3FUaWhYdkQzQ3Y2RVRRSUVhVFMz?=
 =?utf-8?B?THErRnUvMXFTSGxRUTJBT0d5V1VPa2Q3MXlGRFBOZVJyd21jRmswUlE4ZnVj?=
 =?utf-8?B?Mks1elNZNUFDOWlQWHpkWUZWVHVubFN1cXZ2cjJDZ2R1cjJCM3JTZEUzcTlY?=
 =?utf-8?B?dGZzQkdaOGxCcFV4Qm11VDF0d1BzVzE1cmw5d0JoOHNYOG9lUmo5TFFINThx?=
 =?utf-8?B?ei9RdHBodkRtTGZjeTNjZEdoTmphN0thdUs1M3NIbk55K0RlK1RDdzRvdG50?=
 =?utf-8?B?Uy8va1k5QWc2a3dBZVBKMlhyaUFUaWNsdmZ5cWRnSmJ6ZkZ4NXVxSWNpZ2t4?=
 =?utf-8?B?aGw2L0lPYlNxeXYwS0hUWWNOUmRaMDZjZkVxRGxiaUpmeUtGTnBzMG41SUJU?=
 =?utf-8?B?ZmNsNC9kYmpFNWNvUmFiS3EvRlEyMXBBOW14VnVMaGIxZ3pCQ05JNFZDeVBy?=
 =?utf-8?B?QnFXU2IySWtQQmFnT244Y3ZtcmZCcWlLSWdJVGpCZmtrdDhSYnUrbFVLV2Rm?=
 =?utf-8?B?MCsxRkw2c1d0bzY5UFlNNTZlTzJFbXFRMW9iazA4RVNGN2hqYllvV2NPWXhM?=
 =?utf-8?B?bWRpZmk2aFFvRzBhV0lwWGxtaGl3ZFdJM0FrTktyZXlMakkzVFZITDFFOHRz?=
 =?utf-8?B?YUI4ZnB5RXcvcnE5OHBKempVTFRkMTlvR0crN2ZDWDhhdUh4SkFrMkxBa0lL?=
 =?utf-8?B?TWlPbU52eWxlVTJMWW4vaTFCTnNVY2tONVpITHAzMUF4UTVHTEcwMEZzYU81?=
 =?utf-8?B?bm1Odkoya2UvMS9ISGlPSHNNanIyY3o5b2x1WnhxMjhvNFVrR3l3bDFtdkFC?=
 =?utf-8?B?VzJxbG5wOUcvazBhZ0lrVWdzWG9qZXd2YmtVYVQ5VWlWbDFaY205L1pzczhz?=
 =?utf-8?B?L0lSc3JYcGJIcldseWNBaFd3V3U5L0ZDbTFRQzdkVlhnNXNRWjYyS1YweWY4?=
 =?utf-8?B?NUVFQUw1NEJNSHBmcGlnZ291OSt3Wm1sem8rSEkwZUh6K2ROaGJzT1JuTndo?=
 =?utf-8?B?VUZucm0yZDl6S05WT3JRbERKZWdvNWp3Z0xOQ3hZbGU5TTlHdURBdjZBc2lu?=
 =?utf-8?B?MExxSDl5Mmx5Z2FiZXVJVEZ1Nk91dnZGU0VxbjdpTU9XYkxmWC81UWhrSWhr?=
 =?utf-8?B?QzFpNDBYYWJ6WE5QZlNEZ0dDMjlTdWFmbVlsSzdJNDl6Zkh0K3pSU1RvU0VX?=
 =?utf-8?B?YjF3MlVJYkJXajlNR2lYcHJLaGN4ZTdxRjJtMFpERVh3Ti9GNU1VQkJkUW1m?=
 =?utf-8?B?MXZzQ243TEptZjNsdG5lcmpzbUNwZEgyZExickwySUk2ZDhWWGZKdkNkMUlv?=
 =?utf-8?B?bnFXMkQ4YUtUQTZscndHVUJjVkNVQ050bERVQ29KVTY4RmxVZWFEQ2lNY3kz?=
 =?utf-8?B?QmJNNUdqS1kvbDR3bmlRSU1EUUlVMlUyZUZCaVlUUEF3Z2FGSnBBb3lmNG96?=
 =?utf-8?B?QldBZEFicnhkaVVsb2RMRmdXb24ydzhIR3B3NFNWU0t1TVJNNVZxNUxCL0p0?=
 =?utf-8?B?OHZzRkpGTkJmOFkrYnBld1JDV0dCK1BRZGIxdkRFNWYzOTBMWWtlM2lLNjlN?=
 =?utf-8?B?cFp5d092Z2duMUdoVnBjN1VXOWlrSVlkQ1hOc09Qc2xleURMUmU3ZzIwZW1B?=
 =?utf-8?B?QTZjQUpmWDUrLzNKQmdNTVA5ZjhpaWNoNUM5SjdiVEFDZ2cwZlcxUnlDMmZn?=
 =?utf-8?B?QzhZV3ppNjlaM1hzSEdCc1U0SUxpczhHTzRMaVZIcDdhZEJYM1RnQXgvbWU1?=
 =?utf-8?B?ZHV1WXF3RU11R1U0b0tjMGtNQnF0elhmYXRLQ2svRThHcVhxN3BVSk1kUjAx?=
 =?utf-8?B?ZFNXVzlQaGFkbnRUNTFudDBOZnFBTVlZRWExc2lJN1IvZHZkM0lPS1pLQi8z?=
 =?utf-8?B?UDE4N2E2ajJhWmZNY2xrL1RSRnlTQ3dZWTFHOGpRNW9oMWExWk1kcWZlRlg4?=
 =?utf-8?B?MlhpejdhSGN0a21xOXk5M1YycVdla3U0c1FodXpNR0FhakRnNEVYSk9PVEZo?=
 =?utf-8?B?a1BuM2xlR0hPUW5CL2F2Slg5OUIrdERTOXBNcG11TkVib0VjTVlFVk1LbnVk?=
 =?utf-8?B?ODdGeERTRE1jM2tQYlVLTkFiY0VnPT0=?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB1947190DDF78698A8692D423EA2C9DM5PR12MB1947namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e17740-8e50-4200-c038-08d9e9e71385
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2022 03:08:11.8885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /cr33pvVR9+h7JeFrY/D8YnFYyNOgTpn9XRAhdpX/usj+0hraMoVWRQcIgBw06l9TV3qeJWoIhH+V5knN2U93w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1486
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
Cc: "Chen, Horace" <Horace.Chen@amd.com>, "Liu, Monk" <Monk.Liu@amd.com>
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

--_000_DM5PR12MB1947190DDF78698A8692D423EA2C9DM5PR12MB1947namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSBhbHJlYWR5IGRpZCwgdGhhbmtzIHRvIFNoYXl1biBJIGFscmVhZHkgdGVzdGVkIG9uIFhHTUkg
U1JJT1YgYW5kIGl0IGxvb2tzIG9rLiBXaGF0IEkgbmVlZCBub3cgaXMgY29kZSByZXZpZXcsIG1v
c3RseSBvbiB0aGUgbmV3IHBhdGNoZXMgKDgtMTIpLiBJIGhvcGUgeW91LCBNb25rLCBTaGF5dW4s
IExpam8gYW5kIENocmlzdGlhbiBjYW4gaGVscCB3aXRoIHRoYXQuDQoNCkFuZHJleQ0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCkZyb206IENoZW4sIEppbmdXZW4gPEppbmdXZW4u
Q2hlbjJAYW1kLmNvbT4NClNlbnQ6IDA2IEZlYnJ1YXJ5IDIwMjIgMjE6NDENClRvOiBHcm9kem92
c2t5LCBBbmRyZXkgPEFuZHJleS5Hcm9kem92c2t5QGFtZC5jb20+OyBDaHJpc3RpYW4gS8O2bmln
IDxja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbT47IEtvZW5pZywgQ2hyaXN0aWFuIDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBMYXphciwgTGlqbyA8TGlqby5MYXphckBhbWQuY29t
PjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz47IENoZW4sIEppbmdXZW4gPEppbmdXZW4uQ2hlbjJAYW1kLmNvbT4N
CkNjOiBDaGVuLCBIb3JhY2UgPEhvcmFjZS5DaGVuQGFtZC5jb20+OyBMaXUsIE1vbmsgPE1vbmsu
TGl1QGFtZC5jb20+DQpTdWJqZWN0OiBSZTogW1JGQyB2MiA0LzhdIGRybS9hbWRncHU6IFNlcmlh
bGl6ZSBub24gVERSIGdwdSByZWNvdmVyeSB3aXRoIFREUnMNCg0KDQpIaSBBbmRyZXksDQoNCkkg
ZG9uJ3QgaGF2ZSBhbnkgWEdNSSBtYWNoaW5lcyBoZXJlLCBtYXliZSB5b3UgY2FuIHJlYWNoIG91
dCBzaGFveXVuIGZvciBoZWxwLg0KDQpPbiAyMDIyLzEvMjkg5LiK5Y2IMTI6NTcsIEdyb2R6b3Zz
a3ksIEFuZHJleSB3cm90ZToNCkp1c3QgYSBnZW50bGUgcGluZy4NCg0KQW5kcmV5DQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KRnJvbTogR3JvZHpvdnNreSwgQW5kcmV5DQpTZW50
OiAyNiBKYW51YXJ5IDIwMjIgMTA6NTINClRvOiBDaHJpc3RpYW4gS8O2bmlnIDxja29lbmlnLmxl
aWNodHp1bWVya2VuQGdtYWlsLmNvbT48bWFpbHRvOmNrb2VuaWcubGVpY2h0enVtZXJrZW5AZ21h
aWwuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT48bWFp
bHRvOkNocmlzdGlhbi5Lb2VuaWdAYW1kLmNvbT47IExhemFyLCBMaWpvIDxMaWpvLkxhemFyQGFt
ZC5jb20+PG1haWx0bzpMaWpvLkxhemFyQGFtZC5jb20+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPG1haWx0bzpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiA8ZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz48bWFpbHRvOmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzxtYWlsdG86YW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmc+IDxhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz48bWFp
bHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgQ2hlbiwgSmluZ1dlbiA8SmluZ1dl
bi5DaGVuMkBhbWQuY29tPjxtYWlsdG86SmluZ1dlbi5DaGVuMkBhbWQuY29tPg0KQ2M6IENoZW4s
IEhvcmFjZSA8SG9yYWNlLkNoZW5AYW1kLmNvbT48bWFpbHRvOkhvcmFjZS5DaGVuQGFtZC5jb20+
OyBMaXUsIE1vbmsgPE1vbmsuTGl1QGFtZC5jb20+PG1haWx0bzpNb25rLkxpdUBhbWQuY29tPg0K
U3ViamVjdDogUmU6IFtSRkMgdjIgNC84XSBkcm0vYW1kZ3B1OiBTZXJpYWxpemUgbm9uIFREUiBn
cHUgcmVjb3Zlcnkgd2l0aCBURFJzDQoNCg0KSmluZ1dlbiAtIGNvdWxkIHlvdSBtYXliZSBnaXZl
IHRob3NlIHBhdGNoZXMgYSB0cnkgb24gU1JJT1YgWEdNSSBzeXN0ZW0gPyBJZiB5b3Ugc2VlIGlz
c3VlcyBtYXliZSB5b3UgY291bGQgbGV0IG1lIGNvbm5lY3QgYW5kIGRlYnVnLiBNeSBTUklPViBY
R01JIHN5c3RlbSB3aGljaCBTaGF5dW4ga2luZGx5IGFycmFuZ2VkIGZvciBtZSBpcyBub3QgbG9h
ZGluZyB0aGUgZHJpdmVyIHdpdGggbXkgZHJtLW1pc2MtbmV4dCBicmFuY2ggZXZlbiB3aXRob3V0
IG15IHBhdGNoZXMuDQoNCkFuZHJleQ0KDQpPbiAyMDIyLTAxLTE3IDE0OjIxLCBBbmRyZXkgR3Jv
ZHpvdnNreSB3cm90ZToNCg0KDQpPbiAyMDIyLTAxLTE3IDI6MTcgcC5tLiwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToNCkFtIDE3LjAxLjIyIHVtIDIwOjE0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zz
a3k6DQoNClBpbmcgb24gdGhlIHF1ZXN0aW9uDQoNCk9oLCBteSEgVGhhdCB3YXMgYWxyZWFkeSBt
b3JlIHRoYW4gYSB3ZWVrIGFnbyBhbmQgaXMgY29tcGxldGVseSBzd2FwcGVkIG91dCBvZiBteSBo
ZWFkIGFnYWluLg0KDQoNCkFuZHJleQ0KDQpPbiAyMDIyLTAxLTA1IDE6MTEgcC5tLiwgQW5kcmV5
IEdyb2R6b3Zza3kgd3JvdGU6DQpBbHNvLCB3aGF0IGFib3V0IGhhdmluZyB0aGUgcmVzZXRfYWN0
aXZlIG9yIGluX3Jlc2V0IGZsYWcgaW4gdGhlIHJlc2V0X2RvbWFpbiBpdHNlbGY/DQoNCk9mIGhh
bmQgdGhhdCBzb3VuZHMgbGlrZSBhIGdvb2QgaWRlYS4NCg0KDQpXaGF0IHRoZW4gYWJvdXQgdGhl
IGFkZXYtPnJlc2V0X3NlbSBzZW1hcGhvcmUgPyBTaG91bGQgd2UgYWxzbyBtb3ZlIHRoaXMgdG8g
cmVzZXRfZG9tYWluID8gIEJvdGggb2YgdGhlIG1vdmVzIGhhdmUgZnVuY3Rpb25hbA0KaW1wbGlj
YXRpb25zIG9ubHkgZm9yIFhHTUkgY2FzZSBiZWNhdXNlIHRoZXJlIHdpbGwgYmUgY29udGVudGlv
biBvdmVyIGFjY2Vzc2luZyB0aG9zZSBzaW5nbGUgaW5zdGFuY2UgdmFyaWFibGVzIGZyb20gbXVs
dGlwbGUgZGV2aWNlcw0Kd2hpbGUgbm93IGVhY2ggZGV2aWNlIGhhcyBpdCdzIG93biBjb3B5Lg0K
DQpTaW5jZSB0aGlzIGlzIGEgcncgc2VtYXBob3JlIHRoYXQgc2hvdWxkIGJlIHVucHJvYmxlbWF0
aWMgSSB0aGluay4gSXQgY291bGQganVzdCBiZSB0aGF0IHRoZSBjYWNoZSBsaW5lIG9mIHRoZSBs
b2NrIHRoZW4gcGxheXMgcGluZy9wb25nIGJldHdlZW4gdGhlIENQVSBjb3Jlcy4NCg0KDQpXaGF0
IGJlbmVmaXQgdGhlIGNlbnRyYWxpemF0aW9uIGludG8gcmVzZXRfZG9tYWluIGdpdmVzIC0gaXMg
aXQgZm9yIGV4YW1wbGUgdG8gcHJldmVudCBvbmUgZGV2aWNlIGluIGEgaGl2ZSB0cnlpbmcgdG8g
YWNjZXNzIHRocm91Z2ggTU1JTyBhbm90aGVyIG9uZSdzDQpWUkFNIChzaGFyZWQgRkIgbWVtb3J5
KSB3aGlsZSB0aGUgb3RoZXIgb25lIGdvZXMgdGhyb3VnaCByZXNldCA/DQoNCkkgdGhpbmsgdGhh
dCB0aGlzIGlzIHRoZSBraWxsZXIgYXJndW1lbnQgZm9yIGEgY2VudHJhbGl6ZWQgbG9jaywgeWVz
Lg0KDQoNCm5wLCBpIHdpbGwgYWRkIGEgcGF0Y2ggd2l0aCBjZW50cmFsaXppbmcgYm90aCBmbGFn
IGludG8gcmVzZXQgZG9tYWluIGFuZCByZXNlbmQuDQoNCkFuZHJleQ0KDQoNCkNocmlzdGlhbi4N
Cg0KDQpBbmRyZXkNCg0K

--_000_DM5PR12MB1947190DDF78698A8692D423EA2C9DM5PR12MB1947namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5JIGFscmVh
ZHkgZGlkLCB0aGFua3MgdG8gU2hheXVuIEkgYWxyZWFkeSB0ZXN0ZWQgb24gWEdNSSBTUklPViBh
bmQgaXQgbG9va3Mgb2suIFdoYXQgSSBuZWVkIG5vdyBpcyBjb2RlIHJldmlldywgbW9zdGx5IG9u
IHRoZSBuZXcgcGF0Y2hlcyAoOC0xMikuIEkgaG9wZSB5b3UsIE1vbmssIFNoYXl1biwgTGlqbyBh
bmQgQ2hyaXN0aWFuIGNhbiBoZWxwIHdpdGggdGhhdC48L2Rpdj4NCjxkaXY+PGJyPg0KPC9kaXY+
DQo8ZGl2PkFuZHJleTwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0
aDo5OCUiIHRhYmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+
PGZvbnQgZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBj
b2xvcj0iIzAwMDAwMCI+PGI+RnJvbTo8L2I+IENoZW4sIEppbmdXZW4gJmx0O0ppbmdXZW4uQ2hl
bjJAYW1kLmNvbSZndDs8YnI+DQo8Yj5TZW50OjwvYj4gMDYgRmVicnVhcnkgMjAyMiAyMTo0MTxi
cj4NCjxiPlRvOjwvYj4gR3JvZHpvdnNreSwgQW5kcmV5ICZsdDtBbmRyZXkuR3JvZHpvdnNreUBh
bWQuY29tJmd0OzsgQ2hyaXN0aWFuIEvDtm5pZyAmbHQ7Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBn
bWFpbC5jb20mZ3Q7OyBLb2VuaWcsIENocmlzdGlhbiAmbHQ7Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tJmd0OzsgTGF6YXIsIExpam8gJmx0O0xpam8uTGF6YXJAYW1kLmNvbSZndDs7IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcgJmx0O2RyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcmZ3Q7Ow0KIGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnICZsdDthbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyZndDs7IENoZW4sIEppbmdXZW4gJmx0O0ppbmdXZW4uQ2hlbjJAYW1k
LmNvbSZndDs8YnI+DQo8Yj5DYzo8L2I+IENoZW4sIEhvcmFjZSAmbHQ7SG9yYWNlLkNoZW5AYW1k
LmNvbSZndDs7IExpdSwgTW9uayAmbHQ7TW9uay5MaXVAYW1kLmNvbSZndDs8YnI+DQo8Yj5TdWJq
ZWN0OjwvYj4gUmU6IFtSRkMgdjIgNC84XSBkcm0vYW1kZ3B1OiBTZXJpYWxpemUgbm9uIFREUiBn
cHUgcmVjb3Zlcnkgd2l0aCBURFJzPC9mb250Pg0KPGRpdj4mbmJzcDs8L2Rpdj4NCjwvZGl2Pg0K
PGRpdj4NCjxwPkhpIEFuZHJleSw8L3A+DQo8cD5JIGRvbid0IGhhdmUgYW55IFhHTUkgbWFjaGlu
ZXMgaGVyZSwgbWF5YmUgeW91IGNhbiByZWFjaCBvdXQgc2hhb3l1biBmb3IgaGVscC48YnI+DQo8
L3A+DQo8ZGl2IGNsYXNzPSJ4X21vei1jaXRlLXByZWZpeCI+T24gMjAyMi8xLzI5IOS4iuWNiDEy
OjU3LCBHcm9kem92c2t5LCBBbmRyZXkgd3JvdGU6PGJyPg0KPC9kaXY+DQo8YmxvY2txdW90ZSB0
eXBlPSJjaXRlIj4NCjxkaXY+SnVzdCBhIGdlbnRsZSBwaW5nLjwvZGl2Pg0KPGRpdj48YnI+DQo8
L2Rpdj4NCjxkaXY+QW5kcmV5PC9kaXY+DQo8aHIgdGFiaW5kZXg9Ii0xIiBzdHlsZT0iZGlzcGxh
eTppbmxpbmUtYmxvY2s7IHdpZHRoOjk4JSI+DQo8ZGl2IGlkPSJ4X2RpdlJwbHlGd2RNc2ciIGRp
cj0ibHRyIj48Zm9udCBmYWNlPSJDYWxpYnJpLCBzYW5zLXNlcmlmIiBjb2xvcj0iIzAwMDAwMCIg
c3R5bGU9ImZvbnQtc2l6ZToxMXB0Ij48Yj5Gcm9tOjwvYj4gR3JvZHpvdnNreSwgQW5kcmV5PGJy
Pg0KPGI+U2VudDo8L2I+IDI2IEphbnVhcnkgMjAyMiAxMDo1Mjxicj4NCjxiPlRvOjwvYj4gQ2hy
aXN0aWFuIEvDtm5pZyA8YSBjbGFzcz0ieF9tb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1h
aWx0bzpja29lbmlnLmxlaWNodHp1bWVya2VuQGdtYWlsLmNvbSI+DQombHQ7Y2tvZW5pZy5sZWlj
aHR6dW1lcmtlbkBnbWFpbC5jb20mZ3Q7PC9hPjsgS29lbmlnLCBDaHJpc3RpYW4gPGEgY2xhc3M9
InhfbW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86Q2hyaXN0aWFuLktvZW5pZ0Bh
bWQuY29tIj4NCiZsdDtDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20mZ3Q7PC9hPjsgTGF6YXIsIExp
am8gPGEgY2xhc3M9InhfbW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86TGlqby5M
YXphckBhbWQuY29tIj4NCiZsdDtMaWpvLkxhemFyQGFtZC5jb20mZ3Q7PC9hPjsgPGEgY2xhc3M9
InhfbW96LXR4dC1saW5rLWFiYnJldmlhdGVkIiBocmVmPSJtYWlsdG86ZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZyI+DQpkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPC9hPiA8
YSBjbGFzcz0ieF9tb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnIj4NCiZsdDtkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnJmd0OzwvYT47IDxhIGNsYXNzPSJ4X21vei10eHQtbGluay1hYmJyZXZpYXRlZCIgaHJlZj0i
bWFpbHRvOmFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIj4NCmFtZC1nZnhAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPC9hPiA8YSBjbGFzcz0ieF9tb3otdHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9
Im1haWx0bzphbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyI+DQombHQ7YW1kLWdmeEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcmZ3Q7PC9hPjsgQ2hlbiwgSmluZ1dlbiA8YSBjbGFzcz0ieF9tb3ot
dHh0LWxpbmstcmZjMjM5NkUiIGhyZWY9Im1haWx0bzpKaW5nV2VuLkNoZW4yQGFtZC5jb20iPg0K
Jmx0O0ppbmdXZW4uQ2hlbjJAYW1kLmNvbSZndDs8L2E+PGJyPg0KPGI+Q2M6PC9iPiBDaGVuLCBI
b3JhY2UgPGEgY2xhc3M9InhfbW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86SG9y
YWNlLkNoZW5AYW1kLmNvbSI+DQombHQ7SG9yYWNlLkNoZW5AYW1kLmNvbSZndDs8L2E+OyBMaXUs
IE1vbmsgPGEgY2xhc3M9InhfbW96LXR4dC1saW5rLXJmYzIzOTZFIiBocmVmPSJtYWlsdG86TW9u
ay5MaXVAYW1kLmNvbSI+DQombHQ7TW9uay5MaXVAYW1kLmNvbSZndDs8L2E+PGJyPg0KPGI+U3Vi
amVjdDo8L2I+IFJlOiBbUkZDIHYyIDQvOF0gZHJtL2FtZGdwdTogU2VyaWFsaXplIG5vbiBURFIg
Z3B1IHJlY292ZXJ5IHdpdGggVERSczwvZm9udD4NCjxkaXY+Jm5ic3A7PC9kaXY+DQo8L2Rpdj4N
CjxkaXY+DQo8cD5KaW5nV2VuIC0gY291bGQgeW91IG1heWJlIGdpdmUgdGhvc2UgcGF0Y2hlcyBh
IHRyeSBvbiBTUklPViBYR01JIHN5c3RlbSA/IElmIHlvdSBzZWUgaXNzdWVzIG1heWJlIHlvdSBj
b3VsZCBsZXQgbWUgY29ubmVjdCBhbmQgZGVidWcuIE15IFNSSU9WIFhHTUkgc3lzdGVtIHdoaWNo
IFNoYXl1biBraW5kbHkgYXJyYW5nZWQgZm9yIG1lIGlzIG5vdCBsb2FkaW5nIHRoZSBkcml2ZXIg
d2l0aCBteSBkcm0tbWlzYy1uZXh0IGJyYW5jaCBldmVuIHdpdGhvdXQNCiBteSBwYXRjaGVzLjxi
cj4NCjwvcD4NCjxwPkFuZHJleTxicj4NCjwvcD4NCjxkaXYgY2xhc3M9InhfeF9tb3otY2l0ZS1w
cmVmaXgiPk9uIDIwMjItMDEtMTcgMTQ6MjEsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOjxicj4N
CjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+DQo8cD48YnI+DQo8L3A+DQo8ZGl2IGNs
YXNzPSJ4X3hfbW96LWNpdGUtcHJlZml4Ij5PbiAyMDIyLTAxLTE3IDI6MTcgcC5tLiwgQ2hyaXN0
aWFuIEvDtm5pZyB3cm90ZTo8YnI+DQo8L2Rpdj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPkFt
IDE3LjAxLjIyIHVtIDIwOjE0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6PGJyPg0KPGJsb2Nr
cXVvdGUgdHlwZT0iY2l0ZSI+DQo8cD5QaW5nIG9uIHRoZSBxdWVzdGlvbjwvcD4NCjwvYmxvY2tx
dW90ZT4NCjxicj4NCk9oLCBteSEgVGhhdCB3YXMgYWxyZWFkeSBtb3JlIHRoYW4gYSB3ZWVrIGFn
byBhbmQgaXMgY29tcGxldGVseSBzd2FwcGVkIG91dCBvZiBteSBoZWFkIGFnYWluLjxicj4NCjxi
cj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPg0KPHA+QW5kcmV5PGJyPg0KPC9wPg0KPGRpdiBj
bGFzcz0ieF94X21vei1jaXRlLXByZWZpeCI+T24gMjAyMi0wMS0wNSAxOjExIHAubS4sIEFuZHJl
eSBHcm9kem92c2t5IHdyb3RlOjxicj4NCjwvZGl2Pg0KPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+
DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6IzAwN2NmZiI+DQo8YmxvY2tx
dW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0iY29sb3I6IzAwN2NmZiI+QWxzbywgd2hhdCBhYm91dCBo
YXZpbmcgdGhlIHJlc2V0X2FjdGl2ZSBvciBpbl9yZXNldCBmbGFnIGluIHRoZSByZXNldF9kb21h
aW4gaXRzZWxmPw0KPGJyPg0KPC9ibG9ja3F1b3RlPg0KPGJyPg0KT2YgaGFuZCB0aGF0IHNvdW5k
cyBsaWtlIGEgZ29vZCBpZGVhLiA8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQo8YnI+DQpXaGF0
IHRoZW4gYWJvdXQgdGhlIGFkZXYtJmd0O3Jlc2V0X3NlbSBzZW1hcGhvcmUgPyBTaG91bGQgd2Ug
YWxzbyBtb3ZlIHRoaXMgdG8gcmVzZXRfZG9tYWluID8mbmJzcDsgQm90aCBvZiB0aGUgbW92ZXMg
aGF2ZSBmdW5jdGlvbmFsDQo8YnI+DQppbXBsaWNhdGlvbnMgb25seSBmb3IgWEdNSSBjYXNlIGJl
Y2F1c2UgdGhlcmUgd2lsbCBiZSBjb250ZW50aW9uIG92ZXIgYWNjZXNzaW5nIHRob3NlIHNpbmds
ZSBpbnN0YW5jZSB2YXJpYWJsZXMgZnJvbSBtdWx0aXBsZSBkZXZpY2VzDQo8YnI+DQp3aGlsZSBu
b3cgZWFjaCBkZXZpY2UgaGFzIGl0J3Mgb3duIGNvcHkuIDxicj4NCjwvYmxvY2txdW90ZT4NCjwv
YmxvY2txdW90ZT4NCjxicj4NClNpbmNlIHRoaXMgaXMgYSBydyBzZW1hcGhvcmUgdGhhdCBzaG91
bGQgYmUgdW5wcm9ibGVtYXRpYyBJIHRoaW5rLiBJdCBjb3VsZCBqdXN0IGJlIHRoYXQgdGhlIGNh
Y2hlIGxpbmUgb2YgdGhlIGxvY2sgdGhlbiBwbGF5cyBwaW5nL3BvbmcgYmV0d2VlbiB0aGUgQ1BV
IGNvcmVzLjxicj4NCjxicj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPg0KPGJsb2NrcXVvdGUg
dHlwZT0iY2l0ZSI+PGJyPg0KV2hhdCBiZW5lZml0IHRoZSBjZW50cmFsaXphdGlvbiBpbnRvIHJl
c2V0X2RvbWFpbiBnaXZlcyAtIGlzIGl0IGZvciBleGFtcGxlIHRvIHByZXZlbnQgb25lIGRldmlj
ZSBpbiBhIGhpdmUgdHJ5aW5nIHRvIGFjY2VzcyB0aHJvdWdoIE1NSU8gYW5vdGhlciBvbmUncw0K
PGJyPg0KVlJBTSAoc2hhcmVkIEZCIG1lbW9yeSkgd2hpbGUgdGhlIG90aGVyIG9uZSBnb2VzIHRo
cm91Z2ggcmVzZXQgPyA8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQpJ
IHRoaW5rIHRoYXQgdGhpcyBpcyB0aGUga2lsbGVyIGFyZ3VtZW50IGZvciBhIGNlbnRyYWxpemVk
IGxvY2ssIHllcy48YnI+DQo8L2Jsb2NrcXVvdGU+DQo8cD48YnI+DQo8L3A+DQo8cD5ucCwgaSB3
aWxsIGFkZCBhIHBhdGNoIHdpdGggY2VudHJhbGl6aW5nIGJvdGggZmxhZyBpbnRvIHJlc2V0IGRv
bWFpbiBhbmQgcmVzZW5kLjwvcD4NCjxwPkFuZHJleTwvcD4NCjxwPjxicj4NCjwvcD4NCjxibG9j
a3F1b3RlIHR5cGU9ImNpdGUiPjxicj4NCkNocmlzdGlhbi48YnI+DQo8YnI+DQo8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4NCjxibG9ja3F1b3RlIHR5cGU9ImNpdGUiPjxicj4NCkFuZHJleSA8L2Js
b2NrcXVvdGU+DQo8L2Jsb2NrcXVvdGU+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+DQo8L2Jsb2NrcXVv
dGU+DQo8L2Rpdj4NCjwvYmxvY2txdW90ZT4NCjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_DM5PR12MB1947190DDF78698A8692D423EA2C9DM5PR12MB1947namp_--
