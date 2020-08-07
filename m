Return-Path: <amd-gfx-bounces@lists.freedesktop.org>
X-Original-To: lists+amd-gfx@lfdr.de
Delivered-To: lists+amd-gfx@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D123E779
	for <lists+amd-gfx@lfdr.de>; Fri,  7 Aug 2020 08:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA206E05D;
	Fri,  7 Aug 2020 06:57:28 +0000 (UTC)
X-Original-To: amd-gfx@lists.freedesktop.org
Delivered-To: amd-gfx@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450C26E05D
 for <amd-gfx@lists.freedesktop.org>; Fri,  7 Aug 2020 06:57:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUB6LVhNIBt7adKR58uvSXq8qqX6iX9r2SLDr5LwGleYQ3ZSCfd3pDkQ2RzY7gc4mrM3sjFV/vwcaPwWSuf+AxsrTK/20Cs6RUC6g67gY1CSsip6wvrp2o3h7zO94TPgKwCvzDVInYoDqK6c9AyD0U2Ru/PfLT5ni4SBFgQahAxazLC3pveXjUIxgS19kKfJsF/fUhi3LzJpewFs9qY0DjI8Ttns8uUqlK9OfNZpw8dpWSEQfgyS81agRv4j1bSADqglGwJ//LAVmP0vcwTuNiKYFhd6KOtK5NYTIiHmWLr20l9j1EH06Gbhn4phT6TctoKia4RH2bdkYO/UNeipXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H0u2QLgLFjZdMf+GcFu8G3P5cA07PbJGAu7LgbwhSs=;
 b=IIg2qFNDcgGh/z2WV59ChuCVl4T6hdBgu3+3LIxyr0nHj+RhUmAzb29QQLfcnnoxM45QJfE9yjktje8Da+QcPIRSlLkj9/wjvTOOd0tHnKI9PvEZKEOP+4KRGGPgQ+kXSISeOQJ+SphylmU0rIen3yhq3vMgHdDsI2flk5/1Di8HPk0c731BMq9vgicNF4iwTGVBDC3OHZF1n9aqagK/W/r81pTPXuFcK9dM/Jmg9XVsOzbEldAjRnPCNy4DVEdTGQvprORwqy/B6/Jtb0MU4ZiROtBN+owgK1fGoz6nP5BnT0tma6egm9udDmaJlRVswkXIEesKvwn5Lm+o/DfQlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5H0u2QLgLFjZdMf+GcFu8G3P5cA07PbJGAu7LgbwhSs=;
 b=amqed45TprXtvIzCjwFPF2yIxVmZZyZ+sDfPOdXo6Jec6tOgp7/f/phuCDo2D3H5oGkgGpI9gLH0FEG9RgTIwcza7uFEE1JYbpC8i6/ITBSqXmukY7+aSmcA8J8mRn/+rvYTnykqPpA8nJgcrNlckJeng0reHjFniKveCW/LUJ4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4223.namprd12.prod.outlook.com (2603:10b6:208:1d3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.21; Fri, 7 Aug
 2020 06:57:25 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.023; Fri, 7 Aug 2020
 06:57:25 +0000
Subject: Re: [PATCH] drm/amdgpu: annotate a false positive recursive locking
To: "Li, Dennis" <Dennis.Li@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Zhang, Hawking" <Hawking.Zhang@amd.com>
References: <20200806070230.21457-1-Dennis.Li@amd.com>
 <84678659-b4a6-8332-a71b-28d1b412ae16@gmail.com>
 <DM5PR12MB2533F4B9325903B915AD41F9ED480@DM5PR12MB2533.namprd12.prod.outlook.com>
 <031236ab-0646-bf1c-a93b-aec90bc6dab1@amd.com>
 <SN1PR12MB25447D63750B41887E893668ED480@SN1PR12MB2544.namprd12.prod.outlook.com>
 <cf4bc6ce-fca0-1c45-5665-4085a835196a@amd.com>
 <SN1PR12MB254440D6E152B08D3CA8D4C5ED480@SN1PR12MB2544.namprd12.prod.outlook.com>
 <b5d73714-9064-9baa-e687-406f9f4b1b69@amd.com>
 <DM5PR12MB2533C80EDE996B5E79ED169BED480@DM5PR12MB2533.namprd12.prod.outlook.com>
 <9121c08e-9043-b1fc-414a-03e4d7a280e3@amd.com>
 <DM5PR12MB25335CB16FB3B4CE6584355CED490@DM5PR12MB2533.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <77def862-07d6-1079-b767-0ff4827a6234@amd.com>
Date: Fri, 7 Aug 2020 08:57:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DM5PR12MB25335CB16FB3B4CE6584355CED490@DM5PR12MB2533.namprd12.prod.outlook.com>
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0096.eurprd02.prod.outlook.com
 (2603:10a6:208:154::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR02CA0096.eurprd02.prod.outlook.com (2603:10a6:208:154::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20 via Frontend
 Transport; Fri, 7 Aug 2020 06:57:22 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1bb617ef-ecf9-419d-5b05-08d83a9f2316
X-MS-TrafficTypeDiagnostic: MN2PR12MB4223:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4223BA9463E902844CC0FB6083490@MN2PR12MB4223.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BZNxcntGNkEtbJy9vyctz21oGMiP1h03GW522sUnA7qTCIHn+cFf0vUQxKAgzBrDS75p2zY/+1fesTE3KLiTG3m9MTge/KWStG7W3cBaMNkRlBUamHTlaiWn3B0qT7FMFbmduGe4eepsG1DJ2QYTJ+XcY0bYFwSt+ZBOgG5EmZMbzINyHnCOI799bm6xlFXkR5WSx6CVVw7SBE3E5J/GP64Fpyc7LXemIq8sZ9ySjXar25nuCJvX7/ZqOsyb4rruHaki34XQUELUOktAaSXlHMgtiJEknrVje9rx4kEV+EtVgarcXun+VirTwoiPr1KuHeijJM9RZhm6LazlNV3JzOrPoF7SlDXCWo8ojL3mQQiWhCB09z0B9eXQSB7JVN89rcBEOe+nLGpaTiuIvK4ncf4oGXjcRbxKvs4gDMSdU0Ea3DqrmoqoW7sg6NY6H236fMuWYSTzbFsjyZZgBKU6sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(66946007)(2906002)(52116002)(6636002)(30864003)(66476007)(66556008)(966005)(45080400002)(186003)(16526019)(31686004)(5660300002)(36756003)(6666004)(86362001)(2616005)(31696002)(83080400001)(66574015)(83380400001)(8936002)(110136005)(316002)(8676002)(53546011)(6486002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 6qgHrgIMIcqEJ7rQy06Os/SN4uF8H1Bzn0mqZ95kDsrb8MWago+B6QqRHMIBDVD3bq6aXNAotBWPnQbAeCfKuOYSqLTj9o06cQLGt4EqxmGqTDoGIvhq63RikQFFccORj2dNKda9I6MS+oXutOXurnjvP4JiSFKs4/7ULUrIOoCyVbSQ9KEc6/zkChkE+IEgu+EuPltKNOX43v6geLyS2MH6QiQbIx2TUPdO+SDXPvuDc8fY4dP53esJL/U4WEURYoslkZzRDzVkjehy7bTAvMpMp1O66pdgAjZ7RnvmnM8GJRrU0w9lXldwTQPG4lmHunsyWVueploMO8G7XwRoJF9gmAghJc/F3hPQhs325wWt3UL70pLielklJbOGX53sC5pNIWoeQDLSWcwLXAkfiPjlbIac+rc4HV3bhoncCSFrMth5oIMKV9WJQ7pjgQT4unnKL7vL/vu5g0Uip5zOaV6zX1T4mcVyuewGPMwoTD+3uf3E/9oupC4sKIHGrFlJwRjrulkyledxftGmXfOG2TEtvx/yEVL7iPyR0a5uQ1DSEJ/pjIK8zDx3wy8tnNrvMGAdXR+TTn5CemnT9zr8jte1ukib4MLSm83TC20c0y0Yd4jqXdcB+QqaDoLvUIWLSG5/Yu28yQgOOvFMAKfEWSJFo/ls045LA7cJePdQwbzjq+InnBN25rj9L1EFMmxt2kPsjBpeQYSLQfPDv/E01w==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb617ef-ecf9-419d-5b05-08d83a9f2316
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2020 06:57:24.9446 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJANTrrGDHwjc9S/8j4uEBJTyW/RAWUi6ZKMsMJKMVEwIawPDiqYA6ae+87Vvt8U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4223
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: amd-gfx-bounces@lists.freedesktop.org
Sender: "amd-gfx" <amd-gfx-bounces@lists.freedesktop.org>

QW0gMDcuMDguMjAgdW0gMDQ6MjIgc2NocmllYiBMaSwgRGVubmlzOgo+IFtBTUQgUHVibGljIFVz
ZV0KPgo+PiBbU05JUF0KPj4+PiBJIHRoaW5rIGl0IGlzIGEgbGltaXRhdGlvbiBvZiBpbml0X3J3
c2VtLgo+Pj4gQW5kIGV4YWN0bHkgdGhhdCdzIHdyb25nLCB0aGlzIGlzIGludGVudGlvbmFsIGFu
ZCBwZXJmZWN0bHkgY29ycmVjdC4KPj4+Cj4+PiBbRGVubmlzIExpXSBJIGNvdWxkbid0IHVuZGVy
c3RhbmQuIFdoeSBpcyBpdCBhIHBlcmZlY3RseSBjb3JyZWN0Pwo+Pj4gRm9yIGV4YW1wbGUsIHdl
IGRlZmluZSB0d28gcndfc2VtOiBhIGFuZCBiLiBJZiB3ZSBkb24ndCBjaGVjayBpbml0X3J3c2Vt
IGRlZmluaXRpb24sIHdlIG1heSB0aGluayBjYXNlIzEgYW5kIGNhc2UjMiBoYXZlIHRoZSBzYW1l
IGJlaGF2aW9yLCBidXQgaW4gZmFjdCB0aGV5IGFyZSBkaWZmZXJlbnQuCj4+Pgo+Pj4gQ2FzZSAx
Ogo+Pj4gaW5pdF9yd3NlbSgmYSk7Cj4+PiBpbml0X3J3c2VtKCZiKTsKPj4+Cj4+PiBDYXNlMjoK
Pj4+IHZvaWQgaW5pdF9yd3NlbV9leHQocndfc2VtKiBzZW0pCj4+PiB7Cj4+PiAgICAgICAgIGlu
aXRfcndzZW0oc2VtKTsKPj4+IH0KPj4+IGluaXRfcndzZW1fZXh0KCZhKTsKPj4+IGluaXRfcndz
ZW1fZXh0KCZiKTsKPj4+Cj4+PiBBcyBmYXIgYXMgSSBrbm93IGl0IGlzIHBlcmZlY3RseSBwb3Nz
aWJsZSB0aGF0IHRoZSBsb2NrcyBpbiB0aGUgaGl2ZSBhcmUgbm90IGFsd2F5cyBncmFiYmVkIGlu
IHRoZSBzYW1lIG9yZGVyLiBBbmQgdGhhdCdzIHdoeSBsb2NrZGVwIGlzIGNvbXBsYWluaW5nIGFi
b3V0IHRoaXMuCj4+PiBbRGVubmlzIExpXSBOby4gSSB0YWtlcyBhIGhpdmUgd2l0aCB0d28gZGV2
aWNlcyhhIGFuZCBiKSB0byBleHBsYWluIHdoeSBsb2NrZGVwIGNvbXBsYWluLgo+Pj4KPj4+IC8v
IEZpcnN0bHkgZHJpdmVyIGxvY2sgdGhlIHJlc2V0X3NlbSBvZiBhbGwgZGV2aWNlcwo+Pj4gZG93
bl93cml0ZSgmYS0+cmVzZXRfc2VtKTsgZG9fc3VzcGVuZChhKTsKPj4+IGRvd25fd3JpdGUoJmIt
PnJlc2V0X3NlbSk7ICAgLy8gQmVjYXVzZSAgYiBzaGFyZWQgdGhlIHNhbWUgbG9ja19jbGFzc19r
ZXkgd2l0aCBhLCBsb2NrZGVwIHdpbGwgdGFrZSBhIGFuZCBiIGFzIHRoZSBzYW1lIHJ3X3NlbSBh
bmQgY29tcGxhaW4gaGVyZS4KPj4+IGRvX3N1c3BlbmQoYik7Cj4+Pgo+Pj4gLy8gZG8gcmVjb3Zl
cnkKPj4+IGRvX2hpdmVfcmVjb3ZlcnkoKQo+Pj4KPj4+IC8vIHVubG9jayB0aGUgcmVzZXRfc2Vt
IG9mIGFsbCBkZXZpY2VzIGRvX3Jlc3VtZShhKTsKPj4+IHVwX3dyaXRlKCZhLT5yZXNldF9zZW0p
OyBkb19yZXN1bWUoYik7IHVwX3dyaXRlKCZiLT5yZXNldF9zZW0pOwo+PiBBaCEgTm93IEkgdW5k
ZXJzdGFuZCB3aGF0IHlvdSBhcmUgd29ya2luZyBhcm91bmQuIFNvIHRoZSBwcm9ibGVtIGlzIHRo
ZSBzdGF0aWMgbG9ja19jbGFzc19rZXkgaW4gdGhlIG1hY3JvPwo+PiBbRGVubmlzIExpXSBZZXMu
IFRoZSBhdXRob3Igb2YgaW5pdF9yd3NlbSBtaWdodCBub3QgY29uc2lkZXIgb3VyIHNpbWlsYXIg
dXNlIGNhc2UuCgpXZWxsIHRoaXMgaXMgYWxzbyByZWFsbHkgbm90IHRoZSBpbnRlbmRlZCB1c2Ug
Y2FzZS4KCldoZW4geW91IGxvY2sgdGhlIHNhbWUgcndzZW0gY2xhc3MgcmVjdXJzaXZlbHkgeW91
IGNhbiBlYXNpbHkgcnVuIGludG8gCmRlYWRsb2NrcyBpZiB5b3UgZG9uJ3Qga2VlcCB0aGUgb3Jk
ZXIgdGhlIHNhbWUgYWxsIHRoZSB0aW1lLgoKQW5kIGFic3RyYWN0aW5nIGluaXQgZnVuY3Rpb25z
IGJlaGluZCB5b3VyIG93biBsYXllciBpcyBhIG5vLWdvIGluIHRoZSAKTGludXgga2VybmVsIGFz
IHdlbGwuCgo+Pj4gV2hhdCB3ZSBzaG91bGQgZG8gaW5zdGVhZCBpcyB0byBtYWtlIHN1cmUgd2Ug
aGF2ZSBvbmx5IGEgc2luZ2xlIGxvY2sgZm9yIHRoZSBjb21wbGV0ZSBoaXZlIGluc3RlYWQuCj4+
PiBbRGVubmlzIExpXSBJZiB3ZSB1c2UgYSBzaW5nbGUgbG9jaywgdXNlcnMgd2lsbCBtdXN0IHdh
aXQgZm9yIGFsbCBkZXZpY2VzIHJlc3VtaW5nIHN1Y2Nlc3NmdWxseSwgYnV0IGluIGZhY3QgdGhl
aXIgdGFza3MgYXJlIG9ubHkgcnVubmluZyBpbiBkZXZpY2UgYS4gSXQgaXMgbm90IGZyaWVuZGx5
IHRvIHVzZXJzLgo+PiBXZWxsIHRoYXQgaXMgaW50ZW50aW9uYWwgSSB3b3VsZCBzYXkuIFdlIGNh
biBvbmx5IHJlc3RhcnQgc3VibWlzc2lvbnMgYWZ0ZXIgYWxsIGRldmljZXMgYXJlIHJlc3VtZWQg
c3VjY2Vzc2Z1bGx5LCBjYXVzZSBvdGhlcndpc2UgaXQgY2FuIGhhcHBlbiB0aGF0IGEgam9iIG9u
IGRldmljZSBBIGRlcGVuZHMgb24gbWVtb3J5IG9uIGRldmljZSBCIHdoaWNoIGlzbid0IGFjY2Vz
c2libGUuCj4+IFtEZW5uaXMgTGldIFllcywgeW91IGFyZSByaWdodC4gRHJpdmVyIGhhdmUgbWFr
ZSBzdXJlIHRoYXQgdGhlIHNoYXJlZCByZXNvdXJjZXMoc3VjaCBhcyB0aGUgc2hhcmQgbWVtb3J5
KSBhcmUgcmVhZHkgYmVmb3JlIHVubG9jayB0aGUgbG9jayBvZiBhZGV2IG9uZSBieSBvbmUuIEJ1
dCBlYWNoIGRldmljZSBzdGlsbCBoYXMgcHJpdmF0ZSBoYXJkd2FyZSByZXNvdXJjZXMgc3VjaCBh
cyB2aWRlbyAgYW5kIGRpc3BsYXkuCj4gWWVhaCwgYnV0IHRob3NlIGFyZSBuZWdsaWdpYmxlIGFu
ZCB3ZSBoYXZlIGEgdGVhbSB3b3JraW5nIG9uIGRpc3BsYXkgc3VwcG9ydCBmb3IgWEdNSS4gU28g
dGhpcyB3aWxsIHNvb25lciBvciBsYXRlciBiZWNvbWUgYSBwcm9ibGVtIGFzIHdlbGwuCj4KPiBJ
IHN0aWxsIHRoaW5rIHRoYXQgYSBzaW5nbGUgcndzZW0gZm9yIHRoZSB3aG9sZSBoaXZlIGlzIHN0
aWxsIHRoZSBiZXN0IG9wdGlvbiBoZXJlLgo+Cj4gW0Rlbm5pcyBMaV0gRm9yIHlvdXIgYWJvdmUg
Y29uY2Vybiwgd2UgY2FuIG9wZW4gYSBuZXcgdGhyZWFkIHRvIGRpc2N1c3MgaXQuIElmIHdlIG1h
a2UgYSBkZWNpc2lvbiB0byB1c2UgYSBzaW5nbGUgYWZ0ZXIgZGlzY3Vzc2luZywgd2UgY2FuIGNy
ZWF0ZSBhbm90aGVyIHBhdGNoIGZvciBpdC4KClRoYXQncyBhIHJlYWxseSBnb29kIGFyZ3VtZW50
LCBidXQgSSBzdGlsbCBoZXNpdGF0ZSB0byBtZXJnZSB0aGlzIHBhdGNoLiAKSG93IHNldmVyZSBp
cyB0aGUgbG9ja2RlcCBzcGxhdD8KCkF0IGJhcmUgbWluaW11bSB3ZSBuZWVkIGEgIi8qIFRPRE86
IC4uLi4iIGNvbW1lbnQgd2h5IHdlIGRvIHRoaXMgYW5kIGhvdyAKdG8gcmVtb3ZlIHRoZSB3b3Jr
YXJvdW5kIGFnYWluLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEJlc3QgUmVnYXJkcwo+IERl
bm5pcyBsSQo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+PiBSZWdhcmRzLAo+Pj4gQ2hy
aXN0aWFuLgo+Pj4KPj4+IEFtIDA2LjA4LjIwIHVtIDExOjE1IHNjaHJpZWIgTGksIERlbm5pczoK
Pj4+PiBbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHld
Cj4+Pj4KPj4+PiBIaSwgQ2hyaXN0aWFuLAo+Pj4+ICAgICAgICAgIEZvciB0aGlzIGNhc2UsIGl0
IGlzIHNhZmUgdG8gdXNlIHNlcGFyYXRlZCBsb2NrIGtleS4gUGxlYXNlIHNlZSB0aGUgZGVmaW5p
dGlvbiBvZiBpbml0X3J3c2VtIGFzIHRoZSBiZWxvdy4gRXZlcnkgaW5pdF9yd3NlbSBjYWxsaW5n
IHdpbGwgdXNlIGEgbmV3IHN0YXRpYyBrZXksIGJ1dCBkZXZpY2VzIG9mICB0aGUgaGl2ZSBzaGFy
ZSB0aGUgc2FtZSBjb2RlIHRvIGRvIGluaXRpYWxpemF0aW9uLCBzbyB0aGVpciBsb2NrX2NsYXNz
X2tleSBhcmUgdGhlIHNhbWUuIEkgdGhpbmsgaXQgaXMgYSBsaW1pdGF0aW9uIG9mIGluaXRfcndz
ZW0uICBJbiBvdXIgY2FzZSwgaXQgc2hvdWxkIGJlIGNvcnJlY3QgdGhhdCByZXNldF9zZW0gb2Yg
ZWFjaCBhZGV2IGhhcyBkaWZmZXJlbnQgIGxvY2tfY2xhc3Nfa2V5LiBCVFcsIHRoaXMgY2hhbmdl
IGRvZXNuJ3QgZWZmZWN0IGRlYWQtbG9jayBkZXRlY3Rpb24gYW5kIGp1c3QgY29ycmVjdCBpdC4K
Pj4+Pgo+Pj4+ICNkZWZpbmUgaW5pdF9yd3NlbShzZW0pCQkJCQlcCj4+Pj4gZG8gewkJCQkJCQkJ
XAo+Pj4+IAlzdGF0aWMgc3RydWN0IGxvY2tfY2xhc3Nfa2V5IF9fa2V5OwkJCVwKPj4+PiAJCQkJ
CQkJCVwKPj4+PiAJX19pbml0X3J3c2VtKChzZW0pLCAjc2VtLCAmX19rZXkpOwkJCVwKPj4+PiB9
IHdoaWxlICgwKQo+Pj4+Cj4+Pj4gQmVzdCBSZWdhcmRzCj4+Pj4gRGVubmlzIExpCj4+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hy
aXN0aWFuLktvZW5pZ0BhbWQuY29tPgo+Pj4+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgNiwgMjAy
MCA0OjEzIFBNCj4+Pj4gVG86IExpLCBEZW5uaXMgPERlbm5pcy5MaUBhbWQuY29tPjsgYW1kLWdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7Cj4+Pj4gRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5k
ZXIuRGV1Y2hlckBhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4Cj4+Pj4gPEZlbGl4Lkt1ZWhsaW5n
QGFtZC5jb20+OyBaaGFuZywgSGF3a2luZyA8SGF3a2luZy5aaGFuZ0BhbWQuY29tPgo+Pj4+IFN1
YmplY3Q6IFJlOiBbUEFUQ0hdIGRybS9hbWRncHU6IGFubm90YXRlIGEgZmFsc2UgcG9zaXRpdmUg
cmVjdXJzaXZlCj4+Pj4gbG9ja2luZwo+Pj4+Cj4+Pj4gUHJldmVudGluZyBsb2NraW5nIHByb2Js
ZW1zIGR1cmluZyBpbXBsZW1lbnRhdGlvbiBpcyBvYnZpb3VzbHkgYSBnb29kIGFwcHJvYWNoLCBi
dXQgbG9ja2RlcCBoYXMgcHJvdmVuIHRvIGJlIG1hc3NpdmVseSB1c2VmdWwgZm9yIGZpbmRpbmcg
YW5kIGZpeGluZyBwcm9ibGVtcy4KPj4+Pgo+Pj4+IERpc2FibGluZyBsb2NrZGVwIHNwbGF0IGJ5
IGFubm90YXRpbmcgbG9jayB3aXRoIHNlcGFyYXRlIGNsYXNzZXMgaXMgdXN1YWxseSBhIG5vLWdv
IGFuZCBvbmx5IGFsbG93ZWQgaWYgdGhlcmUgaXMgbm8gb3RoZXIgcG90ZW50aWFsIGFwcHJvYWNo
Lgo+Pj4+Cj4+Pj4gSW4gdGhpcyBjYXNlIGhlcmUgd2Ugc2hvdWxkIHJlYWxseSBjbGVhbiB0aGlu
Z3MgdXAgaW5zdGVhZC4KPj4+Pgo+Pj4+IENocmlzdGlhbi4KPj4+Pgo+Pj4+IEFtIDA2LjA4LjIw
IHVtIDA5OjQ0IHNjaHJpZWIgTGksIERlbm5pczoKPj4+Pj4gW0FNRCBPZmZpY2lhbCBVc2UgT25s
eSAtIEludGVybmFsIERpc3RyaWJ1dGlvbiBPbmx5XQo+Pj4+Pgo+Pj4+PiBIaSwgQ2hyaXN0aWFu
LAo+Pj4+PiAgICAgICAgICAgIEkgYWdyZWUgd2l0aCB5b3VyIGNvbmNlcm4uIEhvd2V2ZXIgd2Ug
c2hvdWxkbid0IHJlbHkgb24gc3lzdGVtIHRvIGRldGVjdCBkZWFkLWxvY2ssIGFuZCBzaG91bGQg
Y29uc2lkZXIgdGhpcyB3aGVuIGRvaW5nIGNvZGUgaW1wbGVtZW50YXRpb24uIEluIGZhY3QsIGRl
YWQtbG9jayBkZXRlY3Rpb24gaXNuJ3QgZW5hYmxlZCBieSBkZWZhdWx0Lgo+Pj4+PiAgICAgICAg
ICAgIEZvciB5b3VyIHByb3Bvc2FsIHRvIHJlbW92ZSByZXNldF9zZW0gaW50byB0aGUgaGl2ZSBz
dHJ1Y3R1cmUsIHdlIGNhbiBvcGVuIGEgbmV3IHRvcGljIHRvIGRpc2N1c3MgaXQuIEN1cnJlbnRs
eSB3ZSBjb3VsZG4ndCBtYWtlIHN1cmUgd2hpY2ggaXMgdGhlIGJlc3Qgc29sdXRpb24uIEZvciBl
eGFtcGxlLCB3aXRoIHlvdXIgcHJvcG9zYWwsIHdlIG11c3Qgd2FpdCBmb3IgYWxsIGRldmljZXMg
cmVzdW1pbmcgc3VjY2Vzc2Z1bGx5IGJlZm9yZSByZXN1Ym1pdCBhbiBvbGQgdGFzayBpbiBvbmUg
ZGV2aWNlLCB3aGljaCB3aWxsIGVmZmVjdCBwZXJmb3JtYW5jZS4KPj4+Pj4KPj4+Pj4gQmVzdCBS
ZWdhcmRzCj4+Pj4+IERlbm5pcyBMaQo+Pj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+
Pj4+PiBGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
PiBPbiBCZWhhbGYgT2YKPj4+Pj4gQ2hyaXN0aWFuIEvDtm5pZwo+Pj4+PiBTZW50OiBUaHVyc2Rh
eSwgQXVndXN0IDYsIDIwMjAgMzowOCBQTQo+Pj4+PiBUbzogTGksIERlbm5pcyA8RGVubmlzLkxp
QGFtZC5jb20+OyBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsKPj4+Pj4gRGV1Y2hlciwg
QWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPjsgS3VlaGxpbmcsIEZlbGl4Cj4+
Pj4+IDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcgPEhhd2tpbmcuWmhh
bmdAYW1kLmNvbT4KPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL2FtZGdwdTogYW5ub3Rh
dGUgYSBmYWxzZSBwb3NpdGl2ZQo+Pj4+PiByZWN1cnNpdmUgbG9ja2luZwo+Pj4+Pgo+Pj4+PiBB
bSAwNi4wOC4yMCB1bSAwOTowMiBzY2hyaWViIERlbm5pcyBMaToKPj4+Pj4+IFsgIDU4NC4xMTAz
MDRdID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4+Pj4+PiBb
ICA1ODQuMTEwNTkwXSBXQVJOSU5HOiBwb3NzaWJsZSByZWN1cnNpdmUgbG9ja2luZyBkZXRlY3Rl
ZAo+Pj4+Pj4gWyAgNTg0LjExMDg3Nl0gNS42LjAtZGVsaS12NS42LTI4NDgtZzNmMzEwOWIwZTc1
ZiAjMSBUYWludGVkOiBHICAgICAgICAgICBPRQo+Pj4+Pj4gWyAgNTg0LjExMTE2NF0gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4+Pj4+IFsgIDU4NC4xMTE0
NTZdIGt3b3JrZXIvMzg6MS81NTMgaXMgdHJ5aW5nIHRvIGFjcXVpcmUgbG9jazoKPj4+Pj4+IFsg
IDU4NC4xMTE3MjFdIGZmZmY5YjE1ZmYwYTQ3YTAgKCZhZGV2LT5yZXNldF9zZW0peysrKyt9LCBh
dDoKPj4+Pj4+IGFtZGdwdV9kZXZpY2VfZ3B1X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVd
IFsgIDU4NC4xMTIxMTJdCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICBidXQgdGFzayBpcyBh
bHJlYWR5IGhvbGRpbmcgbG9jazoKPj4+Pj4+IFsgIDU4NC4xMTI2NzNdIGZmZmY5YjE2MDNkMjQ3
YTAgKCZhZGV2LT5yZXNldF9zZW0peysrKyt9LCBhdDoKPj4+Pj4+IGFtZGdwdV9kZXZpY2VfZ3B1
X3JlY292ZXIrMHgyNjIvMHgxMDMwIFthbWRncHVdIFsgIDU4NC4xMTMwNjhdCj4+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgICBvdGhlciBpbmZvIHRoYXQgbWlnaHQgaGVscCB1cyBkZWJ1ZyB0aGlz
Ogo+Pj4+Pj4gWyAgNTg0LjExMzY4OV0gIFBvc3NpYmxlIHVuc2FmZSBsb2NraW5nIHNjZW5hcmlv
Ogo+Pj4+Pj4KPj4+Pj4+IFsgIDU4NC4xMTQzNTBdICAgICAgICBDUFUwCj4+Pj4+PiBbICA1ODQu
MTE0Njg1XSAgICAgICAgLS0tLQo+Pj4+Pj4gWyAgNTg0LjExNTAxNF0gICBsb2NrKCZhZGV2LT5y
ZXNldF9zZW0pOwo+Pj4+Pj4gWyAgNTg0LjExNTM0OV0gICBsb2NrKCZhZGV2LT5yZXNldF9zZW0p
Owo+Pj4+Pj4gWyAgNTg0LjExNTY3OF0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAqKiog
REVBRExPQ0sgKioqCj4+Pj4+Pgo+Pj4+Pj4gWyAgNTg0LjExNjYyNF0gIE1heSBiZSBkdWUgdG8g
bWlzc2luZyBsb2NrIG5lc3Rpbmcgbm90YXRpb24KPj4+Pj4+Cj4+Pj4+PiBbICA1ODQuMTE3Mjg0
XSA0IGxvY2tzIGhlbGQgYnkga3dvcmtlci8zODoxLzU1MzoKPj4+Pj4+IFsgIDU4NC4xMTc2MTZd
ICAjMDogZmZmZjlhZDYzNWMxZDM0OAo+Pj4+Pj4gKCh3cV9jb21wbGV0aW9uKWV2ZW50cyl7Ky4r
Ln0sCj4+Pj4+PiBhdDogcHJvY2Vzc19vbmVfd29yaysweDIxZi8weDYzMCBbICA1ODQuMTE3OTY3
XSAgIzE6Cj4+Pj4+PiBmZmZmYWM3MDhlMWMzZTU4ICgod29ya19jb21wbGV0aW9uKSgmY29uLT5y
ZWNvdmVyeV93b3JrKSl7Ky4rLn0sIGF0Ogo+Pj4+Pj4gcHJvY2Vzc19vbmVfd29yaysweDIxZi8w
eDYzMCBbICA1ODQuMTE4MzU4XSAgIzI6IGZmZmZmZmZmYzFjMmE1ZDAKPj4+Pj4+ICgmdG1wLT5o
aXZlX2xvY2speysuKy59LCBhdDogYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweGFlLzB4MTAz
MCBbYW1kZ3B1XSBbICA1ODQuMTE4Nzg2XSAgIzM6IGZmZmY5YjE2MDNkMjQ3YTAgKCZhZGV2LT5y
ZXNldF9zZW0peysrKyt9LCBhdDogYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweDI2Mi8weDEw
MzAgW2FtZGdwdV0gWyAgNTg0LjExOTIyMl0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgIHN0
YWNrIGJhY2t0cmFjZToKPj4+Pj4+IFsgIDU4NC4xMTk5OTBdIENQVTogMzggUElEOiA1NTMgQ29t
bToga3dvcmtlci8zODoxIEtkdW1wOiBsb2FkZWQgVGFpbnRlZDogRyAgICAgICAgICAgT0UgICAg
IDUuNi4wLWRlbGktdjUuNi0yODQ4LWczZjMxMDliMGU3NWYgIzEKPj4+Pj4+IFsgIDU4NC4xMjA3
ODJdIEhhcmR3YXJlIG5hbWU6IFN1cGVybWljcm8gU1lTLTcwNDlHUC1UUlQvWDExRFBHLVFULAo+
Pj4+Pj4gQklPUyAzLjEgMDUvMjMvMjAxOSBbICA1ODQuMTIxMjIzXSBXb3JrcXVldWU6IGV2ZW50
cwo+Pj4+Pj4gYW1kZ3B1X3Jhc19kb19yZWNvdmVyeSBbYW1kZ3B1XSBbICA1ODQuMTIxNjM4XSBD
YWxsIFRyYWNlOgo+Pj4+Pj4gWyAgNTg0LjEyMjA1MF0gIGR1bXBfc3RhY2srMHg5OC8weGQ1IFsg
IDU4NC4xMjI0OTldCj4+Pj4+PiBfX2xvY2tfYWNxdWlyZSsweDExMzkvMHgxNmUwIFsgIDU4NC4x
MjI5MzFdICA/Cj4+Pj4+PiB0cmFjZV9oYXJkaXJxc19vbisweDNiLzB4ZjAgWyAgNTg0LjEyMzM1
OF0gID8KPj4+Pj4+IGNhbmNlbF9kZWxheWVkX3dvcmsrMHhhNi8weGMwIFsgIDU4NC4xMjM3NzFd
Cj4+Pj4+PiBsb2NrX2FjcXVpcmUrMHhiOC8weDFjMCBbICA1ODQuMTI0MTk3XSAgPwo+Pj4+Pj4g
YW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweDI2Mi8weDEwMzAgW2FtZGdwdV0gWyA1ODQuMTI0
NTk5XSAgZG93bl93cml0ZSsweDQ5LzB4MTIwIFsgIDU4NC4xMjUwMzJdICA/Cj4+Pj4+PiBhbWRn
cHVfZGV2aWNlX2dwdV9yZWNvdmVyKzB4MjYyLzB4MTAzMCBbYW1kZ3B1XSBbICA1ODQuMTI1NDcy
XQo+Pj4+Pj4gYW1kZ3B1X2RldmljZV9ncHVfcmVjb3ZlcisweDI2Mi8weDEwMzAgW2FtZGdwdV0g
WyAgNTg0LjEyNTkxMF0gID8KPj4+Pj4+IGFtZGdwdV9yYXNfZXJyb3JfcXVlcnkrMHgxYjgvMHgy
YTAgW2FtZGdwdV0gWyAgNTg0LjEyNjM2N10KPj4+Pj4+IGFtZGdwdV9yYXNfZG9fcmVjb3Zlcnkr
MHgxNTkvMHgxOTAgW2FtZGdwdV0gWyAgNTg0LjEyNjc4OV0KPj4+Pj4+IHByb2Nlc3Nfb25lX3dv
cmsrMHgyOWUvMHg2MzAgWyAgNTg0LjEyNzIwOF0KPj4+Pj4+IHdvcmtlcl90aHJlYWQrMHgzYy8w
eDNmMCBbICA1ODQuMTI3NjIxXSAgPwo+Pj4+Pj4gX19rdGhyZWFkX3BhcmttZSsweDYxLzB4OTAg
WyAgNTg0LjEyODAxNF0KPj4+Pj4+IGt0aHJlYWQrMHgxMmYvMHgxNTAgWyAgNTg0LjEyODQwMl0g
ID8gcHJvY2Vzc19vbmVfd29yaysweDYzMC8weDYzMAo+Pj4+Pj4ga3RocmVhZCtbCj4+Pj4+PiA1
ODQuMTI4NzkwXSAgPyBrdGhyZWFkX3BhcmsrMHg5MC8weDkwIFsgIDU4NC4xMjkxNzRdCj4+Pj4+
PiByZXRfZnJvbV9mb3JrKzB4M2EvMHg1MAo+Pj4+Pj4KPj4+Pj4+IEVhY2ggYWRldiBoYXMgb3du
ZWQgbG9ja19jbGFzc19rZXkgdG8gYXZvaWQgZmFsc2UgcG9zaXRpdmUKPj4+Pj4+IHJlY3Vyc2l2
ZSBsb2NraW5nLgo+Pj4+PiBOQUssIHRoYXQgaXMgbm90IGEgZmFsc2UgcG9zaXRpdmUgYnV0IGEg
cmVhbCBwcm9ibGVtLgo+Pj4+Pgo+Pj4+PiBUaGUgaXNzdWUgaGVyZSBpcyB0aGF0IHdlIGhhdmUg
bXVsdGlwbGUgcmVzZXQgc2VtYXBob3Jlcywgb25lIGZvciBlYWNoIGRldmljZSBpbiB0aGUgaGl2
ZS4gSWYgdGhvc2UgYXJlIG5vdCBhY3F1aXJlZCBpbiB0aGUgY29ycmVjdCBvcmRlciB3ZSBkZWFk
bG9jay4KPj4+Pj4KPj4+Pj4gVGhlIHJlYWwgc29sdXRpb24gd291bGQgYmUgdG8gbW92ZSB0aGUg
cmVzZXRfc2VtIGludG8gdGhlIGhpdmUgc3RydWN0dXJlIGFuZCBtYWtlIHN1cmUgdGhhdCB3ZSBs
b2NrIGl0IG9ubHkgb25jZS4KPj4+Pj4KPj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pgo+Pj4+Pj4gU2ln
bmVkLW9mZi1ieTogRGVubmlzIExpIDxEZW5uaXMuTGlAYW1kLmNvbT4KPj4+Pj4+IENoYW5nZS1J
ZDogSTc1NzFlZmVjY2JmMTU0ODM5ODIwMzFkMDA1MDRhMzUzMDMxYTg1NGEKPj4+Pj4+Cj4+Pj4+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPj4+Pj4+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmgKPj4+Pj4+IGluZGV4IGU5N2Mw
ODhkMDNiMy4uNzY2ZGM4ZjhjOGEwIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1LmgKPj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdS5oCj4+Pj4+PiBAQCAtOTY3LDYgKzk2Nyw3IEBAIHN0cnVjdCBhbWRncHVfZGV2
aWNlIHsKPj4+Pj4+ICAgICAgICAJYXRvbWljX3QgICAgICAgICAgICAgICAgICAgICAgICBpbl9n
cHVfcmVzZXQ7Cj4+Pj4+PiAgICAgICAgCWVudW0gcHBfbXAxX3N0YXRlICAgICAgICAgICAgICAg
bXAxX3N0YXRlOwo+Pj4+Pj4gICAgICAgIAlzdHJ1Y3Qgcndfc2VtYXBob3JlCXJlc2V0X3NlbTsK
Pj4+Pj4+ICsJc3RydWN0IGxvY2tfY2xhc3Nfa2V5IGxvY2tfa2V5Owo+Pj4+Pj4gICAgICAgIAlz
dHJ1Y3QgYW1kZ3B1X2Rvb3JiZWxsX2luZGV4IGRvb3JiZWxsX2luZGV4Owo+Pj4+Pj4gICAgICAg
IAo+Pj4+Pj4gICAgICAgIAlzdHJ1Y3QgbXV0ZXgJCQlub3RpZmllcl9sb2NrOwo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYwo+Pj4+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+Pj4+IGlu
ZGV4IDZjNTcyZGI0MmQ5Mi4uZDc4ZGY5MzEyZDM0IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jCj4+Pj4+PiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKPj4+Pj4+IEBAIC0zMDM3LDYgKzMw
MzcsNyBAQCBpbnQgYW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAo+Pj4+Pj4gICAgICAgIAltdXRleF9pbml0KCZhZGV2LT52aXJ0LnZmX2Vycm9ycy5sb2NrKTsK
Pj4+Pj4+ICAgICAgICAJaGFzaF9pbml0KGFkZXYtPm1uX2hhc2gpOwo+Pj4+Pj4gICAgICAgIAlp
bml0X3J3c2VtKCZhZGV2LT5yZXNldF9zZW0pOwo+Pj4+Pj4gKwlsb2NrZGVwX3NldF9jbGFzcygm
YWRldi0+cmVzZXRfc2VtLCAmYWRldi0+bG9ja19rZXkpOwo+Pj4+Pj4gICAgICAgIAlhdG9taWNf
c2V0KCZhZGV2LT5pbl9ncHVfcmVzZXQsIDApOwo+Pj4+Pj4gICAgICAgIAltdXRleF9pbml0KCZh
ZGV2LT5wc3AubXV0ZXgpOwo+Pj4+Pj4gICAgICAgIAltdXRleF9pbml0KCZhZGV2LT5ub3RpZmll
cl9sb2NrKTsKPj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4+Pj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRs
b29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbAo+Pj4+PiBpCj4+Pj4+IHMKPj4+Pj4gdAo+Pj4+
PiBzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRmFtZC1nZngmYW1wO2Rh
dGE9MDIlN0MwMSU3Cj4+Pj4+IEMKPj4+Pj4gRAo+Pj4+PiBlCj4+Pj4+IG5uaXMuTGklNDBhbWQu
Y29tJTdDNTZjOTVmOTM5ZGRkNDQxYmQxMDQwOGQ4MzlkNzdjOWUlN0MzZGQ4OTYxZmU0ODgKPj4+
Pj4gNAo+Pj4+PiBlCj4+Pj4+IDYKPj4+Pj4gMDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYz
NzMyMjk0NDk4NTQzNjY1NiZhbXA7c2RhdGE9JTJGQm9SeUVXMwo+Pj4+PiBpCj4+Pj4+IEsKPj4+
Pj4gNQo+Pj4+PiA5WTUyY3RMV2Q0eTFsT21pMkNJbmI2bHBJZ0FGODhpNCUzRCZhbXA7cmVzZXJ2
ZWQ9MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYW1k
LWdmeCBtYWlsaW5nIGxpc3QKYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cg==
